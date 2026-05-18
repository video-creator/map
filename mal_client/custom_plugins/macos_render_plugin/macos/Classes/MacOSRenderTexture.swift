//
//  MacOSRenderTexture.swift
//  Pods
//
//  Created by wangyaqiang on 2025/12/17.
//
import Cocoa
import FlutterMacOS
import CoreVideo
enum RenderPixelFormat: Int {
    case rgba8888 = 0
    case yuv420p = 1
    case yuv444p = 2
    case yuv420p10Bit = 3
    case yuvj420p = 4
}

enum HdrTransferFunction: Int {
    case sdr = 0
    case pq = 1
    case hlg = 2
}
class MacOSRenderTexture: NSObject, FlutterTexture {
    public var textureId: Int64 = -1
    private let registry: FlutterTextureRegistry
    private var pixelBuffer: CVPixelBuffer?
    
    init(registry: FlutterTextureRegistry) {
        self.registry = registry
        super.init()
        self.textureId = registry.register(self)
        registry.register(self)
    }
    func copyPixelBuffer() -> Unmanaged<CVPixelBuffer>? {
        guard let buffer = pixelBuffer else {
            return nil
        }
        // 将所有权移交给 Flutter 引擎 (Retain count +1)
        return Unmanaged.passRetained(buffer)
    }
    /// Flutter 每一帧回调此方法获取用于渲染的 Buffer
    //    func copyPixelBuffer() -> Unmanaged<CVPixelBuffer>? {
    //        // Swift 的 Optional 自动处理了指针传递，CoreVideo 的引用计数由系统管理
    //        // 当返回给 Objective-C/C++ 层时，Flutter 引擎会进行 Retain
    //        return pixelBuffer
    //    }
    
    func dispose() {
        registry.unregisterTexture(textureId)
        pixelBuffer = nil
    }
    
    func update(with data: FlutterStandardTypedData,
                width: Int,
                height: Int,
                format: RenderPixelFormat,
                hdrMode: HdrTransferFunction,
                strides: [NSNumber]?) {
        
        let inputData = data.data
        if inputData.isEmpty { return }
        
        // 释放旧的 Buffer (Swift ARC 会自动处理，只要赋值为 nil 或覆盖)
        pixelBuffer = nil
        
        // 1. 确定 PixelFormatType
        var pixelFormatType: OSType
        switch format {
        case .rgba8888:
            pixelFormatType = kCVPixelFormatType_32BGRA // Flutter/Metal 偏好 BGRA
        case .yuv420p:
            pixelFormatType = kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange
        case .yuvj420p:
            pixelFormatType = kCVPixelFormatType_420YpCbCr8BiPlanarFullRange;
        case .yuv444p:
            pixelFormatType = kCVPixelFormatType_444YpCbCr8
        case .yuv420p10Bit:
            // macOS 上 10bit 通常使用 BiPlanar (P010变种)
            pixelFormatType = kCVPixelFormatType_64RGBAHalf
        }
        
        // 2. 创建 CVPixelBuffer
        let pixelAttributes: [String: Any] = [
            kCVPixelBufferIOSurfacePropertiesKey as String: [:],
            //            kCVPixelBufferMetalCompatibilityKey as String: true
        ]
        
        var newPixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault,
                                         width,
                                         height,
                                         pixelFormatType,
                                         pixelAttributes as CFDictionary,
                                         &newPixelBuffer)
        
        guard status == kCVReturnSuccess, let buffer = newPixelBuffer else {
            print("Failed to create CVPixelBuffer: \(status)")
            return
        }
        
        self.pixelBuffer = buffer
        
        // 3. 锁定 Buffer 地址以写入数据
        CVPixelBufferLockBaseAddress(buffer, [])
        
        // 使用 withUnsafeBytes 安全访问输入数据指针
        inputData.withUnsafeBytes { (rawBufferPointer: UnsafeRawBufferPointer) in
            guard let srcBaseAddress = rawBufferPointer.baseAddress else { return }
            let srcData = srcBaseAddress.assumingMemoryBound(to: UInt8.self)
            
            if format == .rgba8888 {
                // --- RGBA (BGRA) 处理 ---
                guard let destBaseAddress = CVPixelBufferGetBaseAddress(buffer) else { return }
                let dest = destBaseAddress.assumingMemoryBound(to: UInt8.self)
                let bytesPerRow = CVPixelBufferGetBytesPerRow(buffer)
                
                var srcStride = width * 4
                if let s = strides, s.count > 0 { srcStride = s[0].intValue }
                
                for y in 0..<height {
                    let srcRow = srcData.advanced(by: y * srcStride)
                    let destRow = dest.advanced(by: y * bytesPerRow)
                    // memcpy
                    destRow.assign(from: srcRow, count: width * 4)
                }
                
            } else if format == .yuv420p || format == .yuv444p {
                // --- YUV Planar 8-bit 处理 ---
                guard let destYBase = CVPixelBufferGetBaseAddressOfPlane(buffer, 0) else { return }
                let destY = destYBase.assumingMemoryBound(to: UInt8.self)
                let destStrideY = CVPixelBufferGetBytesPerRowOfPlane(buffer, 0)
                
                var srcStrideY = width
                if let s = strides, s.count > 0 { srcStrideY = s[0].intValue }
                
                for y in 0..<height {
                    let srcRow = srcData.advanced(by: y * srcStrideY)
                    let destRow = destY.advanced(by: y * destStrideY)
                    destRow.assign(from: srcRow, count: width)
                }
                
                // 2. 拷贝并交错 U/V 平面 (Plane 1)
                // 输入: UUUU... VVVV...
                // 输出: UVUVUVUV...
                guard let destUVBase = CVPixelBufferGetBaseAddressOfPlane(buffer, 1) else { return }
                let destUV = destUVBase.assumingMemoryBound(to: UInt8.self)
                let destStrideUV = CVPixelBufferGetBytesPerRowOfPlane(buffer, 1)
                
                let halfWidth = width / 2
                let halfHeight = height / 2
                
                // 计算输入数据的偏移量
                let uOffset = srcStrideY * height
                var srcStrideU = halfWidth
                if let s = strides, s.count > 1 { srcStrideU = s[1].intValue }
                
                let vOffset = uOffset + (srcStrideU * halfHeight)
                var srcStrideV = halfWidth
                if let s = strides, s.count > 2 { srcStrideV = s[2].intValue }
                
                for y in 0..<halfHeight {
                    let destRow = destUV.advanced(by: y * destStrideUV)
                    let srcRowU = srcData.advanced(by: uOffset + y * srcStrideU)
                    let srcRowV = srcData.advanced(by: vOffset + y * srcStrideV)
                    
                    // 手动交错 UV
                    for x in 0..<halfWidth {
                        destRow[x * 2]     = srcRowU[x] // U
                        destRow[x * 2 + 1] = srcRowV[x] // V
                    }
                }
                
            } else if format == .yuv420p10Bit {
                // --- YUV 10-bit 处理 (Planar -> BiPlanar) ---
                // Plane 0: Y
                guard let srcBaseAddress = rawBufferPointer.baseAddress else {
                    CVPixelBufferUnlockBaseAddress(buffer, .readOnly)
                    return
                }
                
                // 准备源数据 (P010)，直接从 raw pointer 绑定为 UInt16 指针
                // 这是我们需要的正确数据视图
                let srcP010Data = srcBaseAddress.assumingMemoryBound(to: UInt16.self)
                
                // 获取目标 Buffer (ARGB64)
                guard let destBase = CVPixelBufferGetBaseAddress(buffer) else {
                    CVPixelBufferUnlockBaseAddress(buffer, .readOnly)
                    return
                }
                let destData = destBase.assumingMemoryBound(to: UInt16.self) // 16-bit 指针
                let destBytesPerRow = CVPixelBufferGetBytesPerRow(buffer)
                let destStride = destBytesPerRow / 2 // 转换为 UInt16 的步长
                
                // P010 的 Y Plane stride (以 UInt16 元素为单位)
                let srcStrideY = width
                
                // P010 的 UV Plane 起始指针 (以 UInt16 元素为单位)
                let srcUV = srcP010Data.advanced(by: width * height)
                // P010 的 UV Plane stride (也是 width 个 UInt16 元素)
                let srcStrideUV = width
                
                for y in 0..<height {
                    for x in 0..<width {
                        // 1. 读取 Y (10-bit -> 0..1023)
                        let yIndex = y * srcStrideY + x
                        let yVal = Float(srcP010Data[yIndex])
                        
                        // 2. 读取 UV (10-bit -> 0..1023)
                        // UV 是下采样的，每 2x2 像素共用一个 UV。它们是交错存储的。
                        let uv_y = y / 2
                        let uv_x = x / 2
                        let uvIndex = uv_y * srcStrideUV + uv_x * 2 // U 和 V 是相邻的
                        let uVal = Float(srcUV[uvIndex])     // U
                        let vVal = Float(srcUV[uvIndex + 1]) // V
                        
                        // 3. YUV to RGB 转换公式 (Rec.2020 Limited Range)
                        // 先将 limited range (Video Range) 的 YUV 转为 0-centered
                        let Y = yVal - 64.0
                        let U = uVal - 512.0
                        let V = vVal - 512.0
                        
                        // 转换矩阵 (Rec.2020)
                        var R = 1.16438356 * Y                      + 1.79274107 * V
                        var G = 1.16438356 * Y - 0.21324861 * U - 0.53290933 * V
                        var B = 1.16438356 * Y + 2.11240177 * U
                        
                        // 4. Clip 并扩展到 16-bit (0..65535)
                        // 10-bit (0-1023) -> 16-bit (0-65535) 约等于 * 64
                        R = max(0, min(1023, R)) * 64.0
                        G = max(0, min(1023, G)) * 64.0
                        B = max(0, min(1023, B)) * 64.0
                        
                        // 5. 写入目标 ARGB64 Buffer
                        // kCVPixelFormatType_64ARGB 在内存中是 [A, R, G, B] 顺序
                        // 每个占 16-bit
                        let destIndex = y * destStride + x * 4
                        
                        destData[destIndex + 0] = 0xFFFF       // Alpha (完全不透明)
                        destData[destIndex + 1] = UInt16(R)    // Red
                        destData[destIndex + 2] = UInt16(G)    // Green
                        destData[destIndex + 3] = UInt16(B)    // Blue
                    }
                }
            }
            CVPixelBufferUnlockBaseAddress(buffer, [])
            
            // 4. EDR / HDR 色彩空间处理
            if hdrMode != .sdr {
                CVBufferSetAttachment(buffer, kCVImageBufferColorPrimariesKey, kCVImageBufferColorPrimaries_ITU_R_2020, .shouldPropagate)
                CVBufferSetAttachment(buffer, kCVImageBufferYCbCrMatrixKey, kCVImageBufferYCbCrMatrix_ITU_R_2020, .shouldPropagate)
                var colorSpaceName: CFString?
                if hdrMode == .pq {
                    CVBufferSetAttachment(buffer, kCVImageBufferTransferFunctionKey, kCVImageBufferTransferFunction_SMPTE_ST_2084_PQ, .shouldPropagate)
                    if #available(macOS 11.0, *) {
                        colorSpaceName = CGColorSpace.itur_2100_PQ
                    }
                } else if hdrMode == .hlg {
                    CVBufferSetAttachment(buffer, kCVImageBufferTransferFunctionKey, kCVImageBufferTransferFunction_ITU_R_2100_HLG, .shouldPropagate)
                    if #available(macOS 11.0, *) {
                        colorSpaceName = CGColorSpace.itur_2100_HLG
                    }
                }
                if let name = colorSpaceName, let colorSpace = CGColorSpace(name: name) {
                    CVBufferSetAttachment(buffer, kCVImageBufferCGColorSpaceKey, colorSpace, .shouldPropagate)
                }
            } else {
                // SDR 默认 Rec.709
                CVBufferSetAttachment(buffer, kCVImageBufferColorPrimariesKey, kCVImageBufferColorPrimaries_ITU_R_709_2, .shouldPropagate)
                CVBufferSetAttachment(buffer, kCVImageBufferTransferFunctionKey, kCVImageBufferTransferFunction_ITU_R_709_2, .shouldPropagate)
                CVBufferSetAttachment(buffer, kCVImageBufferYCbCrMatrixKey, kCVImageBufferYCbCrMatrix_ITU_R_709_2, .shouldPropagate)
            }
            
            // 通知 Flutter 纹理已更新
            registry.textureFrameAvailable(textureId)
        }
    }

    func saveRawYUVToFile(srcBaseAddress: UnsafeRawPointer, width: Int, height: Int, format: RenderPixelFormat) {
        guard format == .yuv420p10Bit else {
            print("Only yuv420p10Bit format is supported!")
            return
        }
        
        let bytesPerPixel = 2 // 10-bit 对齐为 16-bit，宽度为 2 字节
        let fileManager = FileManager.default

        // 定义文件路径
        let yPlanePath = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("yuv_y_plane.raw")
        let uPlanePath = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("yuv_u_plane.raw")
        let vPlanePath = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("yuv_v_plane.raw")
        let combinedPath = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("yuv_full.raw")

        // --- 平面大小计算 ---
        let ySize = width * height * bytesPerPixel
        let uvWidth = width / 2
        let uvHeight = height / 2
        let uvSize = uvWidth * uvHeight * bytesPerPixel
        
        // --- 定位 Y、U、V 数据在内存中的起始地址 ---
        let yPlanePtr = srcBaseAddress
        let uPlanePtr = srcBaseAddress.advanced(by: ySize)
        let vPlanePtr = uPlanePtr.advanced(by: uvSize)
        
        // --- 保存到文件 ---
        do {
            // 1. 保存 Y 平面
            let yData = Data(bytes: yPlanePtr, count: ySize)
            try yData.write(to: yPlanePath)

            // 2. 保存 U 平面
            let uData = Data(bytes: uPlanePtr, count: uvSize)
            try uData.write(to: uPlanePath)

            // 3. 保存 V 平面
            let vData = Data(bytes: vPlanePtr, count: uvSize)
            try vData.write(to: vPlanePath)

            // 4. 如果需要保存为单个文件（将 Y, U, V 合并）
            let combinedData = yData + uData + vData
            try combinedData.write(to: combinedPath)

            print("YUV data saved successfully!")
            print("Y Plane Path: \(yPlanePath)")
            print("U Plane Path: \(uPlanePath)")
            print("V Plane Path: \(vPlanePath)")
            print("Combined File Path: \(combinedPath)")
        } catch {
            print("Failed to save YUV data: \(error)")
        }
    }

    func updatePlatformView(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? [String: Any],
              let width = args["width"] as? Int,
              let height = args["height"] as? Int,
              let formatInt = args["format"] as? Int,
              let data = args["data"] as? FlutterStandardTypedData, // Dart 传来的 bytes
              let view = VideoPlatformViewFactory.currentView // 获取当前显示的 View
        else {
            result(FlutterError(code: "INVALID_ARGS", message: "Missing arguments", details: nil))
            return
        }
        
        let format = RenderPixelFormat(rawValue: formatInt) ?? .rgba8888
        let bytes = data.data
        
        // 1. 创建 CVPixelBuffer
        var pixelBuffer: CVPixelBuffer?
        var pixelFormatType: OSType
        
        switch format {
        case .rgba8888:
            pixelFormatType = kCVPixelFormatType_32BGRA
        case .yuv420p:
            pixelFormatType = kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange;
        case .yuvj420p:
            pixelFormatType = kCVPixelFormatType_420YpCbCr8BiPlanarFullRange;
        case .yuv444p:
            pixelFormatType = kCVPixelFormatType_444YpCbCr8BiPlanarVideoRange;
        case .yuv420p10Bit:
            // --- 这里的关键点 ---
            // AVSampleBufferDisplayLayer 原生支持 P010 (x420)，无需 Metal 兼容 Key
            // 所以这里直接用 Video Range 即可
            pixelFormatType = kCVPixelFormatType_420YpCbCr10BiPlanarVideoRange
        }
        
        // 创建 Buffer (不需要 MetalCompatibilityKey)
        let pixelAttributes: [String: Any] = [
            kCVPixelBufferIOSurfacePropertiesKey as String: [:]
        ]
        
        let status = CVPixelBufferCreate(kCFAllocatorDefault, width, height, pixelFormatType, pixelAttributes as CFDictionary, &pixelBuffer)
        
        guard status == kCVReturnSuccess, let buffer = pixelBuffer else {
            result(FlutterError(code: "BUFFER_ERROR", message: "Failed to create CVPixelBuffer: \(status)", details: nil))
            return
        }
        
        // 2. 填充数据 (拷贝 Dart 数据到 CVPixelBuffer)
        CVPixelBufferLockBaseAddress(buffer, [])
        
        // 获取原始数据指针
        bytes.withUnsafeBytes { rawBufferPointer in
            guard let srcBaseAddress = rawBufferPointer.baseAddress else { return }
//            saveRawYUVToFile(srcBaseAddress: srcBaseAddress, width: width, height: height, format: format);
            if format == .rgba8888 {
                // RGBA 拷贝
                if let destBase = CVPixelBufferGetBaseAddress(buffer) {
                    let destBytesPerRow = CVPixelBufferGetBytesPerRow(buffer)
                    let rowBytes = width * 4
                    for y in 0..<height {
                        let srcRow = srcBaseAddress.advanced(by: y * rowBytes)
                        let destRow = destBase.advanced(by: y * destBytesPerRow)
                        destRow.copyMemory(from: srcRow, byteCount: rowBytes)
                    }
                }
            } else if format == .yuv420p || format == .yuvj420p || format == .yuv420p10Bit {
                // YUV 拷贝 (包含 8-bit 和 10-bit)
                // 10-bit P010 需要将 Planar Y + Planar UV 转换为 BiPlanar (NV12/P010 布局)
                // 注意：这里假设 Dart 传来的是 ffmpeg 默认的 yuv420p10le (3 planes: Y, U, V)
                // 而 CVPixelBuffer 是 BiPlanar (2 planes: Y, UV)
                
                let is10Bit = (format == .yuv420p10Bit)
                let bytesPerPixel = is10Bit ? 2 : 1
                
                // Plane 0: Y
                if let destY = CVPixelBufferGetBaseAddressOfPlane(buffer, 0) {
                    let destStrideY = CVPixelBufferGetBytesPerRowOfPlane(buffer, 0)
                    let srcStrideY = width * bytesPerPixel
                    
                    for y in 0..<height {
                        let srcRow = srcBaseAddress.advanced(by: y * srcStrideY)
                        let srcPtr = srcRow.assumingMemoryBound(to: UInt16.self)
                        let destRow = destY.advanced(by: y * destStrideY)
                        let destPtr = destRow.assumingMemoryBound(to: UInt16.self)
                        if is10Bit {
                            for z in 0..<width {
                                destPtr[z] = srcPtr[z] << 6  //macos 要求高位存放
                            }
                        } else {
                            destRow.copyMemory(from: srcRow, byteCount: srcStrideY)
                        }
                        
                        
//
                    }
                }
                
                // Plane 1: UV (Interleaved)
                // Dart 数据通常是 Planar (Y, U, V 分开)，我们需要交织 U 和 V
                if let destUV = CVPixelBufferGetBaseAddressOfPlane(buffer, 1) {
                    let destStrideUV = CVPixelBufferGetBytesPerRowOfPlane(buffer, 1)
                    let uvHeight = height / 2
                    let uvWidth = width / 2
                    
                    // 计算源数据中 U 和 V 的偏移
                    let ySize = width * height * bytesPerPixel
                    let uSize = uvWidth * uvHeight * bytesPerPixel
                    
                    let srcU = srcBaseAddress.advanced(by: ySize)
                    let srcV = srcU.advanced(by: uSize)
                    
                    if is10Bit {
                        // 10-bit (UInt16) 交织
                        let destPtr = destUV.assumingMemoryBound(to: UInt16.self)
                        let srcUPtr = srcU.assumingMemoryBound(to: UInt16.self)
                        let srcVPtr = srcV.assumingMemoryBound(to: UInt16.self)
                        let destStrideElements = destStrideUV / 2
                        
                        for y in 0..<uvHeight {
                            for x in 0..<uvWidth {
                                let uVal = (srcUPtr[y * uvWidth + x] << 6)
                                let vVal = (srcVPtr[y * uvWidth + x] << 6)
                                
                                let destIndex = y * destStrideElements + x * 2
                                destPtr[destIndex] = uVal     // U
                                destPtr[destIndex + 1] = vVal // V
                            }
                        }
                    } else {
                        // 8-bit (UInt8) 交织
                        let destPtr = destUV.assumingMemoryBound(to: UInt8.self)
                        let srcUPtr = srcU.assumingMemoryBound(to: UInt8.self)
                        let srcVPtr = srcV.assumingMemoryBound(to: UInt8.self)
                        
                        for y in 0..<uvHeight {
                            for x in 0..<uvWidth {
                                let uVal = srcUPtr[y * uvWidth + x]
                                let vVal = srcVPtr[y * uvWidth + x]
                                
                                let destIndex = y * destStrideUV + x * 2
                                destPtr[destIndex] = uVal
                                destPtr[destIndex + 1] = vVal
                            }
                        }
                    }
                }
            }
        }
        
        // 3. 设置 Color Space (对 HDR 至关重要)
        if format == .yuv420p10Bit {
            // 标记为 Rec.2020 HLG (或 PQ)
            CVBufferSetAttachment(buffer, kCVImageBufferColorPrimariesKey, kCVImageBufferColorPrimaries_ITU_R_2020, .shouldPropagate)
            CVBufferSetAttachment(buffer, kCVImageBufferTransferFunctionKey, kCVImageBufferTransferFunction_ITU_R_2100_HLG, .shouldPropagate) // 或 _SMPTE_ST_2084_PQ
            CVBufferSetAttachment(buffer, kCVImageBufferYCbCrMatrixKey, kCVImageBufferYCbCrMatrix_ITU_R_2020, .shouldPropagate)
        } else if format == .yuv420p || format == .yuvj420p {
            // BT.709
            CVBufferSetAttachment(buffer, kCVImageBufferColorPrimariesKey, kCVImageBufferColorPrimaries_ITU_R_709_2, .shouldPropagate)
            CVBufferSetAttachment(buffer, kCVImageBufferTransferFunctionKey, kCVImageBufferTransferFunction_ITU_R_709_2, .shouldPropagate)
            CVBufferSetAttachment(buffer, kCVImageBufferYCbCrMatrixKey, kCVImageBufferYCbCrMatrix_ITU_R_709_2, .shouldPropagate)
        }
        
        CVPixelBufferUnlockBaseAddress(buffer, [])
        
        // 4. 将 CVPixelBuffer 包装为 CMSampleBuffer
        var sampleBuffer: CMSampleBuffer?
        var formatDescription: CMVideoFormatDescription?
        CMVideoFormatDescriptionCreateForImageBuffer(allocator: kCFAllocatorDefault, imageBuffer: buffer, formatDescriptionOut: &formatDescription)
        
        guard let formatDesc = formatDescription else { return }
        
        var timing = CMSampleTimingInfo()
        timing.presentationTimeStamp = CMClockGetTime(CMClockGetHostTimeClock()) // 立即播放
        timing.duration = CMTime.invalid
        timing.decodeTimeStamp = CMTime.invalid
        
        CMSampleBufferCreateReadyWithImageBuffer(
            allocator: kCFAllocatorDefault,
            imageBuffer: buffer,
            formatDescription: formatDesc,
            sampleTiming: &timing,
            sampleBufferOut: &sampleBuffer
        )
        
        // 5. 提交给 Layer 显示
        if let sb = sampleBuffer {
            view.enqueue(sb)
            result(true)
        } else {
            result(false)
        }
    }
}
