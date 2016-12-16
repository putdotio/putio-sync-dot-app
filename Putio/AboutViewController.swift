//
//  AboutViewController.swift
//  Putio
//
//  Created by İbrahim on 16/12/16.
//  Copyright © 2016 Put.io. All rights reserved.
//

import Cocoa

class AboutViewController: NSViewController {

    @IBOutlet weak var versionField: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        let version = Bundle.main.infoDictionary?["CFBundleVersion"] as! String

        versionField.stringValue = "Version " + version
    }
}
