//
//  ViewController.swift
//  JHColorPickerController
//
//  Created by JHays on 07/09/2015.
//  Copyright (c) 2015 JHays. All rights reserved.
//

import UIKit
import JHColorPicker

class ViewController: UIViewController, JHColorPickerControllerDelegate {
    
    @IBOutlet weak var changeColorBtn:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        changeColorBtn.layer.borderColor = UIColor.whiteColor().CGColor
        changeColorBtn.layer.borderWidth = 1.0
        changeColorBtn.layer.cornerRadius = 4.0
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let color = view.backgroundColor {
            applyViewableTextColorForColor(color)
        }
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
 
    func applyViewableTextColorForColor(color:UIColor) {
        
        var textColor = UIColor.blackColor()
        var shadowColor = UIColor.whiteColor()
        
        if !color.isLight() {
            textColor = UIColor.whiteColor()
            shadowColor = UIColor.blackColor()
        }

        changeColorBtn.setTitleColor(textColor, forState: .Normal)
        changeColorBtn.layer.borderColor = textColor.CGColor
        changeColorBtn.layer.shadowColor = shadowColor.CGColor
        changeColorBtn.layer.shadowOffset = CGSize(width: 0, height: 0)
        changeColorBtn.layer.shadowOpacity = 1.0
        changeColorBtn.layer.shadowRadius = 2

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

extension UIColor {
    
    func isLight() -> Bool
    {
        let components = CGColorGetComponents(self.CGColor)
        let comp0 = components[0] * 299
        let comp1 = components[1] * 587
        let comp2 = components[2] * 114
        let brightness = (comp0 + comp1 + comp2) / 1000
        
        if brightness < 0.5 {
            return false
        }
        else {
            return true
        }
    }
    
}

