//
//  ViewController.swift
//  JHColorPickerController
//
//  Created by JHays on 07/09/2015.
//  Copyright (c) 2015 JHays. All rights reserved.
//

import UIKit
import JHColorPickerController

class ViewController: UIViewController {

    @IBOutlet weak var imageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        

       
       var myBundle =  NSBundle(forClass: JHColorPickerController.self)
        var assetPath = myBundle.pathForResource("JHColorPickerController.bundle/gradient", ofType:"png")
        //imageView.image = UIImage(contentsOfFile: assetPath!)

        let controller = JHColorPickerController()
        self.presentViewController(controller, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

