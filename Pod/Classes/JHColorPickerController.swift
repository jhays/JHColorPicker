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

protocol JHPickerControllerDelegate {
    func colorSelected(color:UIColor, name:String?)
}

public class JHColorPickerController: UIViewController/*, UICollectionViewDataSource, UICollectionViewDelegate */{

    enum ColorCategory{
        case Crayola
        case Pantone
        case Flat
        case Custom
    }
    
    @IBOutlet weak var previousColorView:UIView!
    @IBOutlet weak var selectedColorView:UIView!
    @IBOutlet weak var categorySelectorSegmentedControl: UISegmentedControl!
    @IBOutlet weak var swatchView:UIView!
    @IBOutlet weak var swatchCollectionView:UICollectionView!
    @IBOutlet weak var customView:UIView!
    
    var delegate:JHPickerControllerDelegate?
    var colorSwatches = Array<Dictionary<String,AnyObject>>()
    
    var selectedColorCategory:ColorCategory = .Crayola {
        didSet {
            switch selectedColorCategory {
            case .Crayola:
                customView.hidden = true
                swatchView.hidden = false
            case .Pantone:
                customView.hidden = true
                swatchView.hidden = false
            case .Flat:
                customView.hidden = true
                swatchView.hidden = false
            case .Custom:
                swatchView.hidden = true
                customView.hidden = false
            }
        }
    }
    var selectedColor: UIColor?{
        didSet{
            selectedColorView.backgroundColor = selectedColor
        }
    }
    var selectedColorName: String?
    var previousColor: UIColor? {
        didSet{
            previousColorView.backgroundColor = previousColor
        }
    }
    var previousColorName:String?
    
    convenience init() {
        let bundle = NSBundle(forClass:JHColorPickerController.self)
        self.init(nibName: "JHColorPickerController.bundle/JHColorPickerController", bundle: bundle)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNavButtons()
    }
    
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)


    }
    
    func loadNavButtons() {
        let leftCancelBtn = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "cancelBtnPressed:")
        let rightSaveBtn = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.Plain, target: self, action: "saveBtnPressed:")
        self.navigationItem.leftBarButtonItem = leftCancelBtn
        self.navigationItem.rightBarButtonItem = rightSaveBtn
    }

    func cancelBtnPressed(sender:UIButton) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func saveBtnPressed(sender:UIButton) {
        if let color = selectedColor {
            delegate?.colorSelected(color, name: selectedColorName)
        }else {
            
        }
        
    }
    
    @IBAction func colorCategorySegmentedControlValueChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectedColorCategory = .Crayola
        case 1:
            selectedColorCategory = .Pantone
        case 2:
            selectedColorCategory = .Flat
        case 3:
            selectedColorCategory = .Custom
        default:
            selectedColorCategory = .Custom
        }
    }

    
    
}