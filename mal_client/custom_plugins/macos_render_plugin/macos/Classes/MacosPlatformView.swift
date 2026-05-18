//
//  MacosPlatformView.swift
//  Pods
//
//  Created by wangyaqiang on 2025/12/17.
//

import FlutterMacOS
import AVFoundation

class VideoPlatformViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger
    // 用一个静态或者单例来存储 View 的引用，以便 Channel 能找到它
    // 实际项目中建议使用 map 管理多个 view
    static var currentView: VideoPlayerView?

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(withViewIdentifier viewId: Int64, arguments args: Any?) -> NSView {
        let view = VideoPlayerView(frame: .zero)
        VideoPlatformViewFactory.currentView = view
        return view
    }
}
