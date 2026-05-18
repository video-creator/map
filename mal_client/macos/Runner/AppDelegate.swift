import Cocoa
import FlutterMacOS
var shouldExit = false
@main
class AppDelegate: FlutterAppDelegate {
    var process: Process? = nil;
    override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        if process?.isRunning ?? false {
            process?.terminate()
            print("进程已终止")
        }
        return true
    }
    // 全局或类内部变量，用于控制退出标志
    override func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
        return .terminateNow
    }
    func startProcessWithStateListener() {
        // 创建 Process 对象
        process = Process()

        // 设置要执行的命令路径，例如 `/bin/ls`
    var path: String? = "/Users/wangyaqiang/Library/Developer/Xcode/DerivedData/Demo-fokhsqftlbpplhbhftwoegosgnmg/Build/Products/Debug/Demo";
        path = Bundle.main.path(forResource: "Demo", ofType: nil)
        if path == nil {
            return
        }
        process?.executableURL = URL(fileURLWithPath: path!)

        // 设置参数，如果不需要参数，可以传空数组

        // 捕捉标准输出和错误输出
        let outputPipe = Pipe()
        let errorPipe = Pipe()
        process?.standardOutput = outputPipe
        process?.standardError = errorPipe

        // 异步读取标准输出数据
        outputPipe.fileHandleForReading.readabilityHandler = { handle in
            let availableData = handle.availableData
            guard !availableData.isEmpty else { return }
            if let output = String(data: availableData, encoding: .utf8) {
                print("Standard Output: \(output)")
            }
        }

        // 异步读取错误输出数据
        errorPipe.fileHandleForReading.readabilityHandler = { handle in
            let availableData = handle.availableData
            guard !availableData.isEmpty else { return }
            if let errorOutput = String(data: availableData, encoding: .utf8) {
                print("Standard Error: \(errorOutput)")
            }
        }

        // 设置进程状态监听器
        process?.terminationHandler = { terminatedProcess in
            DispatchQueue.main.async {
                print("进程 \(terminatedProcess.processIdentifier) 结束了")
                print("退出代码: \(terminatedProcess.terminationStatus)")
                print("终止原因: \(terminatedProcess.terminationReason == .exit ? "正常退出" : "被信号杀死")")

                // 清理管道资源
                outputPipe.fileHandleForReading.readabilityHandler = nil
                errorPipe.fileHandleForReading.readabilityHandler = nil

                // 如果收到退出标志，则退出应用程序
                if shouldExit {
                    exit(15) // 使用 SIGTERM 的信号编号 15 作为退出码
                }
            }
        }

        // 启动进程
        do {
            try process?.run()
            print("进程 \(process?.processIdentifier ?? -1) 正在运行")
        } catch {
            print("启动进程失败: \(error.localizedDescription)")
        }
    }

    func terminateAllDemoProcesses() {
        let processName = "Demo" // 要终止的进程名
        
        // 1. 使用 pgrep 查找所有名为 "Demo" 的进程 PID
        let findTask = Process()
        findTask.executableURL = URL(fileURLWithPath: "/usr/bin/pgrep")
        findTask.arguments = ["-x", processName] // -x 表示精确匹配
        
        let outputPipe = Pipe()
        findTask.standardOutput = outputPipe
        
        do {
            try findTask.run()
            findTask.waitUntilExit()
            
            // 2. 读取 pgrep 输出（包含所有匹配进程的 PID）
            let outputData = outputPipe.fileHandleForReading.readDataToEndOfFile()
            guard let outputString = String(data: outputData, encoding: .utf8), !outputString.isEmpty else {
                print("未找到名为 '\(processName)' 的进程")
                return
            }
            
            // 3. 解析 PID 列表
            let pids = outputString.components(separatedBy: .newlines).compactMap { line in
                Int(line.trimmingCharacters(in: .whitespacesAndNewlines))
            }
            
            // 4. 遍历并终止每个进程
            for pid in pids {
                let killTask = Process()
                killTask.executableURL = URL(fileURLWithPath: "/bin/kill")
                killTask.arguments = ["-9", "\(pid)"] // SIGKILL 强制终止
                
                do {
                    try killTask.run()
                    killTask.waitUntilExit()
                    print("已终止进程 \(processName) (PID: \(pid))")
                } catch {
                    print("终止进程 \(pid) 失败: \(error.localizedDescription)")
                }
            }
        } catch {
            print("查找进程失败: \(error.localizedDescription)")
        }
    }
    // 强引用保存 GCD 信号源
    private var sigtermSource: DispatchSourceSignal?
    private var sigintSource: DispatchSourceSignal?
    private func setupSignals() {
        // 屏蔽默认行为，把信号交给 DispatchSource
        signal(SIGTERM, SIG_IGN)
        signal(SIGINT, SIG_IGN) // 可选：Ctrl-C

        // SIGTERM
        let termSrc = DispatchSource.makeSignalSource(signal: SIGTERM, queue: .main)
        termSrc.setEventHandler { [weak self] in
            self?.handleTerminationSignal(name: "SIGTERM")
        }
        termSrc.resume()
        self.sigtermSource = termSrc

        // 可选：SIGINT（Ctrl-C）
        let intSrc = DispatchSource.makeSignalSource(signal: SIGINT, queue: .main)
        intSrc.setEventHandler { [weak self] in
            self?.handleTerminationSignal(name: "SIGINT")
        }
        intSrc.resume()
        self.sigintSource = intSrc
    }

    private func handleTerminationSignal(name: String) {
        if process?.isRunning == true {
            process?.terminate()
            print("收到 \(name)，子进程已被关闭")
        }

        // 清理读取回调，防止悬挂
//        outputPipe?.fileHandleForReading.readabilityHandler = nil
//        errorPipe?.fileHandleForReading.readabilityHandler = nil

        // 退出应用
        exit(0)
    }
    override func applicationDidFinishLaunching(_ notification: Notification) {
        
        #if DEBUG
        #else
        terminateAllDemoProcesses();
        startProcessWithStateListener();
        #endif
        
        setupSignals()
    }
    override func applicationWillTerminate(_ notification: Notification) {
        print("applicationWillTerminate")
        handleTerminationSignal(name: "SIGTERM")
    }
    override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
      return true
    }
   
}
