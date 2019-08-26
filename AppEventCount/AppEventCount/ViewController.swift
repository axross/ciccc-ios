//
//  ViewController.swift
//  AppEventCount
//
//  Created by Kohei Asai on 8/26/19.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var didFinishLaunching: UILabel!
    @IBOutlet weak var willResignActive: UILabel!
    @IBOutlet weak var didEnterBackground: UILabel!
    @IBOutlet weak var willEnterForeground: UILabel!
    @IBOutlet weak var didBecomeActive: UILabel!
    @IBOutlet weak var willTerminate: UILabel!
    
    var didFinishLaunchingCount = 0
    var willResignActiveCount = 0
    var didEnterBackgroundCount = 0
    var willEnterForegroundCount = 0
    var didBecomeActiveCount = 0
    var willTerminateCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        didFinishLaunching.text = "didFinishLaunching: \(didFinishLaunchingCount)"
        willResignActive.text = "willResignActive: \(willResignActiveCount)"
        didEnterBackground.text = "didEnterBackground: \(didEnterBackgroundCount)"
        willEnterForeground.text = "willEnterForeground: \(willEnterForegroundCount)"
        didBecomeActive.text = "didBecomeActive: \(didBecomeActiveCount)"
        willTerminate.text = "willTerminate: \(willTerminateCount)"
    }
}

