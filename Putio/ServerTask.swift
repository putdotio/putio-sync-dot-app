import Foundation

class ServerTask {
    var task: Process
    let launchPath = Bundle.main.resourcePath! + "/Data/putio-sync-cli"
    var arguments: [String]
    let URL = NSURL(string: "http://127.0.0.1:3000")

    init() {
        print(Bundle.main.resourcePath!)
        arguments = ["-server"]

        task = Process()
        task.launchPath = launchPath
        task.arguments = self.arguments
    }

    func launch() {
        task.launch()
        sleep(UInt32(0.5))
    }

    func exit() {
        task.terminate()
        task.waitUntilExit()
    }
}
