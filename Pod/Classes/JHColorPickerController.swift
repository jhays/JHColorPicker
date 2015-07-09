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

     convenience init() {
        let bundle = NSBundle(forClass:JHColorPickerController.self)
        self.init(nibName: "JHColorPickerController.bundle/JHColorPickerController", bundle: bundle)
    }
    
    public override func viewDidLoad() {
        
        println("VDL")
    }
    
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("VDA")
        self.view.backgroundColor = UIColor.flatSandColor()
    }

}