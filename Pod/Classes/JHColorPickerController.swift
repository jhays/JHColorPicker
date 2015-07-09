//
//  JHColorPickerController.swift
//  JHColorPickerController
//
//  Created by Julian Hays on 7/8/15.
//  Copyright (c) 2015 orbosphere. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

public class JHColorPickerController: UIViewController {

//     convenience init() {
//        //let frameworkBundleID = "com.orbosphere.JHColorPickerController"
//        //let frameworkBundle = NSBundle(identifier: frameworkBundleID)
//        let bundle = NSBundle(forClass:JHColorPickerController.self)
//        self.init(nibName: "JHColorPickerController", bundle: bundle)
//    }
    
    public override func viewDidLoad() {
        
        
    }
    
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.view.backgroundColor = UIColor.flatRedColor()
    }

}