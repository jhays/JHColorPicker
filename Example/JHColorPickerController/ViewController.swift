//
//  ViewController.swift
//  JHColorPickerController
//
//  Created by JHays on 07/09/2015.
//  Copyright (c) 2015 JHays. All rights reserved.
//

import UIKit
import JHColorPickerController

class ViewController: UIViewController, JHColorPickerControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func changeColorBtnPressed(sender: AnyObject) {
        let colorPickerController = JHColorPickerController()
        colorPickerController.delegate = self
        colorPickerController.previousColor = self.view.backgroundColor
        colorPickerController.completion = { selectedColor in
             self.view.backgroundColor = selectedColor
        }
        self.presentViewController(UINavigationController(rootViewController: colorPickerController), animated: true, completion: nil)
    }
 
    
    func colorSaved(color:UIColor, name:String?) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func colorSelected(color: UIColor, name: String?) {
        //useful if you are displaying in a popover and you want to use the color as they change it
    }
    
    func colorPickerCancelled() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}


