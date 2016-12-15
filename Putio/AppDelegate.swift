//
//  AppDelegate.swift
//  Putio
//
//  Created by İbrahim on 17/08/16.
//  Copyright © 2016 Put.io. All rights reserved.
//

import Cocoa

// task that runs the HTTP server
var serverTask = ServerTask()

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {

    let statusItem = NSStatusBar.system().statusItem(withLength: NSSquareStatusItemLength)

    @IBOutlet weak var menu: NSMenu!
    @IBOutlet weak var sparkleUpdater: NSObject!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        serverTask.launch()
        statusItem.highlightMode = true
        statusItem.menu = menu

        if let statusItemButton = statusItem.button {
            statusItemButton.image = NSImage(named: "StatusItemButtonImage")

            // react on both clicks
            let options: NSEventMask = [.leftMouseUp, .rightMouseUp]
            statusItemButton.sendAction(on: NSEventMask(rawValue: UInt64(Int(options.rawValue))))
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        serverTask.exit()
    }

    @IBAction func openClicked(_ sender: AnyObject) {
        NSWorkspace.shared().open(serverTask.URL as! URL)
    }

    @IBAction func quitClicked(_ sender: AnyObject) {
        NSApplication.shared().terminate(self)
    }
}
