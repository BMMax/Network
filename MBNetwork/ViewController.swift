//
//  ViewController.swift
//  MBNetwork
//
//  Created by user on 2017/11/16.
//  Copyright © 2017年 mobin. All rights reserved.
//

import UIKit

var currentController: ViewController?
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currentController = self
    }
}
