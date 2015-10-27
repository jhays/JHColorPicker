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
import UIColor_Crayola
import UIColor_Pantone

public protocol JHColorPickerControllerDelegate {
    func colorSaved(color:UIColor, name:String?)
    func colorSelected(color:UIColor, name:String?)
    func colorPickerCancelled()
}

class SwatchCell: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var colorView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        colorView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height - 28))
        title = UILabel(frame: CGRect(x: 0, y: frame.size.height - 28, width: frame.size.width, height: 28))
        
        self.addSubview(colorView)
        self.addSubview(title)
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        contentView.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        title.font = UIFont(name: "HelveticaNeue-Light", size: 14.0)
        title.textAlignment = NSTextAlignment.Center
        title.numberOfLines = 2
        title.lineBreakMode = NSLineBreakMode.ByWordWrapping
    }
    
}

public class JHColorPickerController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    enum ColorCategory{
        case Crayola
        case Pantone
        case Flat
        case Custom
    }
    
    @IBOutlet weak var previousColorView:UIView!
    @IBOutlet weak var selectedColorView:UIView!
    @IBOutlet weak var previousColorLabel:UILabel!
    @IBOutlet weak var selectedColorLabel:UILabel!
    @IBOutlet weak var previousColorNameLabel: UILabel!
    @IBOutlet weak var selectedColorNameLabel: UILabel!
    @IBOutlet weak var categorySelectorSegmentedControl: UISegmentedControl!
    @IBOutlet weak var swatchView:UIView!
    @IBOutlet weak var swatchCollectionView:UICollectionView!
    @IBOutlet weak var customView:UIView!
    
    public var delegate:JHColorPickerControllerDelegate?
    public var completion : ((UIColor) -> ())?
    var colorSwatches = Array<Dictionary<String,AnyObject>>()
    var infColorPicker : InfColorPickerController!
    
    var selectedColorCategory:ColorCategory = .Crayola {
        didSet {
            switch selectedColorCategory {
            case .Crayola:
                customView.hidden = true
                swatchView.hidden = false
                colorSwatches = ColorLibraries.crayolaColors
            case .Pantone:
                customView.hidden = true
                swatchView.hidden = false
                colorSwatches = ColorLibraries.pantoneColors
            case .Flat:
                customView.hidden = true
                swatchView.hidden = false
                colorSwatches = ColorLibraries.flatColors
            case .Custom:
                swatchView.hidden = true
                customView.hidden = false
                infColorPicker.view.hidden = false
            }
            swatchCollectionView.reloadData()
        }
    }
    var selectedColor: UIColor?{
        didSet{
            selectedColorView.backgroundColor = selectedColor
            infColorPicker.sourceColor = selectedColor
            delegate?.colorSelected(selectedColor!, name: selectedColorName)
            applyLabelColors()
        }
    }
    var selectedColorName: String? {
        didSet{
            selectedColorNameLabel.text = selectedColorName
        }
    }

    public var previousColor: UIColor?
    public var previousColorName:String?{
        didSet{
            previousColorNameLabel.text = previousColorName
        }
    }
    
    convenience init() {
        let bundle = NSBundle(forClass:JHColorPickerController.self)
        self.init(nibName: "JHColorPicker.bundle/JHColorPickerController", bundle: bundle)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = NSBundle(forClass:JHColorPickerController.self)
        swatchCollectionView.registerNib(UINib(nibName: "JHColorPicker.bundle/SwatchCell", bundle: bundle), forCellWithReuseIdentifier: "swatchCell")
//        swatchCollectionView.registerClass(SwatchCell.self, forCellWithReuseIdentifier: "swatchCell")
        loadNavButtons()
        
        colorSwatches = ColorLibraries.crayolaColors
        
        infColorPicker = InfColorPickerController.colorPickerViewController()
        infColorPicker.willMoveToParentViewController(self)
        infColorPicker.view.hidden = true
        customView.addSubview(infColorPicker.view)
        infColorPicker.didMoveToParentViewController(self)
        
        
        
        //this is unfortunate, but any attempts to implement InfColorPickerDelegate have resulted in failure to compile. 
        //must be something to do with communicating between ObjC and Swift... this notification will have to do for now.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "colorPickerDidChangeColor:", name: "CUSTOM_COLOR_DID_CHANGE", object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    public override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animateAlongsideTransition({ (context) -> Void in
            
        }, completion: { (context) -> Void in
            self.swatchCollectionView.collectionViewLayout.invalidateLayout()
        })
    }
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        if let previousColor = previousColor {
            previousColorView.backgroundColor = previousColor
            previousColorName = ColorLibraries.nameForColor(previousColor)
            infColorPicker.sourceColor = previousColor
        }
        applyLabelColors()
    }
    
    public override func viewDidAppear(animated:Bool) {
        super.viewDidAppear(animated)
        infColorPicker.view.frame = customView.bounds
    }
    
    func loadNavButtons() {
        let leftCancelBtn = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "cancelBtnPressed:")
        let rightSaveBtn = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.Plain, target: self, action: "saveBtnPressed:")
        self.navigationItem.leftBarButtonItem = leftCancelBtn
        self.navigationItem.rightBarButtonItem = rightSaveBtn
    }
    
    func applyLabelColors() {
        
        var prevTextColor = UIColor.blackColor()
        var prevShadowColor = UIColor.whiteColor()
        
        if let previousColor = previousColor {
            if !previousColor.isLight() {
                prevTextColor = UIColor.whiteColor()
                prevShadowColor = UIColor.blackColor()
            }
        }
        
        var selectedTextColor = UIColor.blackColor()
        var selectedShadowColor = UIColor.whiteColor()
        
        if let selectedColor = selectedColor {
            if !selectedColor.isLight() {
                selectedTextColor = UIColor.whiteColor()
                selectedShadowColor = UIColor.blackColor()
            }
        }
        
        previousColorLabel.textColor = prevTextColor
        previousColorLabel.layer.shadowColor = prevShadowColor.CGColor
        previousColorLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        previousColorLabel.layer.shadowOpacity = 1.0
        previousColorLabel.layer.shadowRadius = 2
        
        previousColorNameLabel.textColor = prevTextColor
        previousColorNameLabel.layer.shadowColor = prevShadowColor.CGColor
        previousColorNameLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        previousColorNameLabel.layer.shadowOpacity = 1.0
        previousColorNameLabel.layer.shadowRadius = 2
        
        selectedColorLabel.textColor = selectedTextColor
        selectedColorLabel.layer.shadowColor = selectedShadowColor.CGColor
        selectedColorLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        selectedColorLabel.layer.shadowOpacity = 1.0
        selectedColorLabel.layer.shadowRadius = 2
        
        selectedColorNameLabel.textColor = selectedTextColor
        selectedColorNameLabel.layer.shadowColor = selectedShadowColor.CGColor
        selectedColorNameLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        selectedColorNameLabel.layer.shadowOpacity = 1.0
        selectedColorNameLabel.layer.shadowRadius = 2
    }

    @IBAction func cancelBtnPressed(sender:UIButton) {
        delegate?.colorPickerCancelled()
    }
    
    @IBAction func saveBtnPressed(sender:UIButton) {
        if let color = selectedColor {
            if let completion = completion {
                completion(color)
            }
            delegate?.colorSaved(color, name: selectedColorName)
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
    
    @IBAction func darkBtnPressed(sender: UIButton) {
        
        selectedColor = selectedColor?.darkerColor(0.01)
    }
    
    
    @IBAction func brightBtnPressed(sender: AnyObject) {
        selectedColor = selectedColor?.lighterColor(0.01)
    }

    func colorPickerDidChangeColor(notification:NSNotification) {
        if let userInfo = notification.userInfo {
            if let resultColor = userInfo["resultColor"] as? UIColor {
                selectedColor = resultColor
                selectedColorName = selectedColor!.toHexString()
            }
        }
        applyLabelColors()
    }
    
    //MARK: UICollectionViewDelegate
    
    public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        selectedColor = colorSwatches[indexPath.item]["color"] as? UIColor
        selectedColorName = colorSwatches[indexPath.item]["title"] as? String
    }
    
    // MARK: UICollectionViewDataSource
    
    public func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //#warning Incomplete method implementation -- Return the number of items in the section
    return colorSwatches.count
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("swatchCell", forIndexPath: indexPath) as! SwatchCell
        //cell.title.text = self.colorSwatches[indexPath.row % 5]
        //let curr = indexPath.row % 5  + 1

        cell.title.text = colorSwatches[indexPath.item]["title"] as? String
        cell.colorView.backgroundColor = colorSwatches[indexPath.item]["color"] as? UIColor
        //cell.pinImage.image = UIImage(named: imgName)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
            if self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.Compact {
                let height = (swatchCollectionView.frame.size.height - 16) / 2
                let width = (swatchCollectionView.frame.size.width - 16) / 2
                return CGSize(width: width, height: height)
            }else {
                let height = (swatchCollectionView.frame.size.height - 16) / 2
                let width = (self.view.frame.size.width - 48) / 2
                return CGSize(width: width, height: height)
            }
    }
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}