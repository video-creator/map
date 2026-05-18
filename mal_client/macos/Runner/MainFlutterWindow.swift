import Cocoa
import FlutterMacOS
import desktop_multi_window
class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)
    self.isRestorable = false 
    RegisterGeneratedPlugins(registry: flutterViewController)
      FlutterMultiWindowPlugin.setOnWindowCreatedCallback { newflutterViewController  in
          RegisterGeneratedPlugins(registry: newflutterViewController)
      }
    super.awakeFromNib()
  }
}
