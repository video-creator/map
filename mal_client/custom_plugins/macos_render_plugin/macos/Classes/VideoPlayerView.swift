//
//  VideoPlayerView.swift
//  Pods
//
//  Created by wangyaqiang on 2025/12/17.
//
import Cocoa
import AVFoundation

class VideoPlayerView: NSView {
    private var displayLayer: AVSampleBufferDisplayLayer!

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayer()
    }
    
    private func setupLayer() {
        // 创建 AVSampleBufferDisplayLayer
        displayLayer = AVSampleBufferDisplayLayer()
        displayLayer.videoGravity = .resizeAspect // 保持比例
        if #available(macOS 14.0, *) {
            displayLayer.wantsExtendedDynamicRangeContent = true
        }
        // 关键：设置 layer 为 opaque，这对 HDR 渲染很重要
        displayLayer.isOpaque = true
        
        // 将 layer 添加到视图
        self.wantsLayer = true
        self.layer?.addSublayer(displayLayer)
    }
    
    override func layout() {
        super.layout()
        // 确保 layer 始终填满 view
        displayLayer.frame = self.bounds
    }
    
    // --- 核心方法：接收并显示 CMSampleBuffer ---
    func enqueue(_ sampleBuffer: CMSampleBuffer) {
        if displayLayer.status == .failed {
            displayLayer.flush()
        }
        displayLayer.enqueue(sampleBuffer)
    }
    
    // 清空画面
    func flush() {
        displayLayer.flush()
    }
}

