import Cocoa
import FlutterMacOS

public class MacosRenderPlugin: NSObject, FlutterPlugin {
    private var renderTextures: [Int64: MacOSRenderTexture] = [:]
    private let textures: FlutterTextureRegistry
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "macos_render_plugin", binaryMessenger: registrar.messenger)
        let instance = MacosRenderPlugin(textures:registrar.textures)
        registrar.addMethodCallDelegate(instance, channel: channel)
        let factory = VideoPlatformViewFactory(messenger: registrar.messenger)
        registrar.register(factory, withId: "video_view")
    }
    init(textures: FlutterTextureRegistry) {
        self.textures = textures
        super.init()
    }
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
        case "createTexture":
            let texture = MacOSRenderTexture(registry: textures)
            renderTextures[texture.textureId] = texture
            result(texture.textureId)
        case "disposeTexture":
            guard let args = call.arguments as? [String: Any],
                let textureId = args["textureId"] as? Int64 else {
                result(FlutterError(code: "InvalidArguments", message: "textureId is required", details: nil))
                return
            }
            if let texture = renderTextures[textureId] {
                texture.dispose()
                renderTextures.removeValue(forKey: textureId)
            }
            result(nil)
        case "updateTexture":
            guard let args = call.arguments as? [String: Any],
                let textureId = args["textureId"] as? Int64 else {
                result(FlutterError(code: "InvalidArguments", message: "textureId is required", details: nil))
                return
            }
            
            if let texture = renderTextures[textureId] {
                guard let data = args["data"] as? FlutterStandardTypedData,
                      let width = args["width"] as? Int,
                      let height = args["height"] as? Int,
                      let formatInt = args["format"] as? Int,
                      let hdrModeInt = args["hdrMode"] as? Int,
                      let format = RenderPixelFormat(rawValue: formatInt),
                      let hdrMode = HdrTransferFunction(rawValue: hdrModeInt) else {
                    result(FlutterError(code: "InvalidArguments", message: "Invalid update parameters", details: nil))
                    return
                }
                
                let strides = args["strides"] as? [NSNumber]
//                
//                texture.update(with: data,
//                               width: width,
//                               height: height,
//                               format: format,
//                               hdrMode: hdrMode,
//                               strides: strides)
                
//                result(nil)
                texture.updatePlatformView(call, result: result);
            } else {
                result(FlutterError(code: "TextureNotFound", message: "Texture ID not found", details: nil))
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
