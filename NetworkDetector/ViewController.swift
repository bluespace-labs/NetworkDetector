//
//  ViewController.swift
//  NetworkDetector
//
//  Created by liwei on 2019/12/19.
//  Copyright © 2019 Blue Space Inc. All rights reserved.
//

import UIKit
import Network

class ViewController: UIViewController {
    @IBOutlet weak var resultTextView: UITextView!
    var monitor = NWPathMonitor()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        monitor.cancel()
    }

    @IBAction func onDetectButtonTouched(_ sender: Any) {
        monitor.start(queue: DispatchQueue.main)
        monitor.pathUpdateHandler = { self.show($0) }
        show(monitor.currentPath)
    }

    func show(_ path: NWPath) {
        let text = "Using cellular? \(path.usesInterfaceType(.cellular))\n"
        + "Using Wi-Fi? \(path.usesInterfaceType(.wifi))"
        resultTextView.text = text
    }

}

