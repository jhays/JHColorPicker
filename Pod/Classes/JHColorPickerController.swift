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

class SwatchCell: UICollectionViewCell {
    var title: UILabel!
    var colorView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        colorView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height - 32))
        title = UILabel(frame: CGRect(x: 0, y: frame.size.height - 32, width: frame.size.width, height: 32))
        title.font = UIFont(name: "HeleveticaNeue-Light", size: 16.0)
        title.textAlignment = NSTextAlignment.Center
        title.numberOfLines = 2
        title.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.addSubview(colorView)
        self.addSubview(title)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        swatchCollectionView.registerClass(SwatchCell.self, forCellWithReuseIdentifier: "swatchCell")
        loadNavButtons()
    }
    
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = UIColor.flatRedColor()
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

    
    // MARK: UICollectionViewDataSource
    
    public func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }
    
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //#warning Incomplete method implementation -- Return the number of items in the section
    return 50
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("swatchCell", forIndexPath: indexPath) as! SwatchCell
    //cell.title.text = self.colorSwatches[indexPath.row % 5]
    //let curr = indexPath.row % 5  + 1
    cell.title.text = "Orange"
    cell.colorView.backgroundColor = .orangeColor()
    //cell.pinImage.image = UIImage(named: imgName)
    
    return cell
    }
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        sizeForItemAtIndexPath indexPath: NSIndexPath!) -> CGSize {
            var squareSize = (view.frame.size.width - 48) / 2
    return CGSize(width: squareSize, height: squareSize)
    }
    
    func collectionView(collectionView: UICollectionView!,
        layout collectionViewLayout: UICollectionViewLayout!,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    //Color arrays

   /* var crayolaColors = [["color": UIColor.crayolaAbsoluteZeroColor(), "title" : "Absolute Zero"]
        ,["color": UIColor.crayolaAlienArmpitColor(), "title" : "Alien Armpit"]
        ,["color": UIColor.crayolaAlloyOrangeColor(), "title" : "Alloy Orange"]
        ,["color": UIColor.crayolaAlmondColor(), "title" : "Almond"]
        ,["color": UIColor.crayolaAmethystColor(), "title" : "Amethyst"]
        ,["color": UIColor.crayolaAntiqueBrassColor(), "title" : "Antique Brass"]
        ,["color": UIColor.crayolaApricotColor(), "title" : "Apricot"]
        ,["color": UIColor.crayolaAquaPearlColor(), "title" : "Aqua Pearl"]
        ,["color": UIColor.crayolaAquamarineColor(), "title" : "Aquamarine"]
        ,["color": UIColor.crayolaAsparagusColor(), "title" : "Asparagus"]
        ,["color": UIColor.crayolaAtomicTangerineColor(), "title" : "Atomic Tangerine"]
        ,["color": UIColor.crayolaAztecGoldColor(), "title" : "Aztec Gold"]
        ,["color": UIColor.crayolaBabyPowderColor(), "title" : "Baby Powder"]
        ,["color": UIColor.crayolaBananaColor(), "title" : "Banana"]
        ,["color": UIColor.crayolaBananaManiaColor(), "title" : "Banana Mania"]
        ,["color": UIColor.crayolaBdazzledBlueColor(), "title" : "Bdazzled Blue"]
        ,["color": UIColor.crayolaBeaverColor(), "title" : "Beaver"]
        ,["color": UIColor.crayolaBigDipORubyColor(), "title" : "Big DipORuby"]
        ,["color": UIColor.crayolaBigFootFeetColor(), "title" : "Big Foot Feet"]
        ,["color": UIColor.crayolaBittersweetColor(), "title" : "Bittersweet"]
        ,["color": UIColor.crayolaBittersweetShimmerColor(), "title" : "Bittersweet Shimmer"]
        ,["color": UIColor.crayolaBlackColor(), "title" : "Black"]
        ,["color": UIColor.crayolaBlackCoralPearlColor(), "title" : "Black Coral Pearl"]
        ,["color": UIColor.crayolaBlackShadowsColor(), "title" : "Black Shadows"]
        ,["color": UIColor.crayolaBlastOffBronzeColor(), "title" : "Blast Off Bronze"]
        ,["color": UIColor.crayolaBlizzardBlueColor(), "title" : "Blizzard Blue"]
        ,["color": UIColor.crayolaBlueColor(), "title" : "Blue"]
        ,["color": UIColor.crayolaBlueBellColor(), "title" : "Blue Bell"]
        ,["color": UIColor.crayolaBlueGrayColor(), "title" : "Blue Gray"]
        ,["color": UIColor.crayolaBlueGreenColor(), "title" : "Blue Green"]
        ,["color": UIColor.crayolaBlueJeansColor(), "title" : "Blue Jeans"]
        ,["color": UIColor.crayolaBlueVioletColor(), "title" : "Blue Violet"]
        ,["color": UIColor.crayolaBlueberryColor(), "title" : "Blueberry"]
        ,["color": UIColor.crayolaBlushColor(), "title" : "Blush"]
        ,["color": UIColor.crayolaBoogerBusterColor(), "title" : "Booger Buster"]
        ,["color": UIColor.crayolaBrickRedColor(), "title" : "Brick Red"]
        ,["color": UIColor.crayolaBrightYellowColor(), "title" : "Bright Yellow"]
        ,["color": UIColor.crayolaBrownColor(), "title" : "Brown"]
        ,["color": UIColor.crayolaBrownSugarColor(), "title" : "Brown Sugar"]
        ,["color": UIColor.crayolaBubbleGumColor(), "title" : "Bubblegum"]
        ,["color": UIColor.crayolaBurnishedBrownColor(), "title" : "Burnished Brown"]
        ,["color": UIColor.crayolaBurntOrangeColor(), "title" : "Burnt Orange"]
        ,["color": UIColor.crayolaBurntSiennaColor(), "title" : "Burnt Sienna"]
        ,["color": UIColor.crayolaCadetBlueColor(), "title" : "Cadet Blue"]
        ,["color": UIColor.crayolaCanaryColor(), "title" : "Canary"]
        ,["color": UIColor.crayolaCaribbeanGreenColor(), "title" : "Caribbean Green"]
        ,["color": UIColor.crayolaCaribbeanGreenPearlColor(), "title" : "Caribbean Green Pearl"]
        ,["color": UIColor.crayolaCarnationPinkColor(), "title" : "Carnation Pink"]
        ,["color": UIColor.crayolaCedarChestColor(), "title" : "Cedar Chest"]
        ,["color": UIColor.crayolaCeriseColor(), "title" : "Cerise"]
        ,["color": UIColor.crayolaCeruleanColor(), "title" : "Cerulean"]
        ,["color": UIColor.crayolaCeruleanFrostColor(), "title" : "Cerulean Frost"]
        ,["color": UIColor.crayolaCherryColor(), "title" : "Cherry"]
        ,["color": UIColor.crayolaChestnutColor(), "title" : "Chestnut"]
        ,["color": UIColor.crayolaChocolateColor(), "title" : "Chocolate"]
        ,["color": UIColor.crayolaCinnamonSatinColor(), "title" : "Cinnamon Satin"]
        ,["color": UIColor.crayolaCitrineColor(), "title" : "Citrine"]
        ,["color": UIColor.crayolaCoconutColor(), "title" : "Coconut"]
        ,["color": UIColor.crayolaCopperColor(), "title" : "Copper"]
        ,["color": UIColor.crayolaCopperPennyColor(), "title" : "Copper Penny"]
        ,["color": UIColor.crayolaCornflowerColor(), "title" : "Cornflower"]
        ,["color": UIColor.crayolaCosmicCobaltColor(), "title" : "Cosmic Cobalt"]
        ,["color": UIColor.crayolaCottonCandyColor(), "title" : "Cotton Candy"]
        ,["color": UIColor.crayolaCulturedPearlColor(), "title" : "Cultured Pearl"]
        ,["color": UIColor.crayolaCyberGrapeColor(), "title" : "Cyber Grape"]
        ,["color": UIColor.crayolaDaffodilColor(), "title" : "Daffodil"]
        ,["color": UIColor.crayolaDandelionColor(), "title" : "Dandelion"]
        ,["color": UIColor.crayolaDeepSpaceSparkleColor(), "title" : "Deep Space Sparkle"]
        ,["color": UIColor.crayolaDenimColor(), "title" : "Denim"]
        ,["color": UIColor.crayolaDenimBlueColor(), "title" : "Denim Blue"]
        ,["color": UIColor.crayolaDesertSandColor(), "title" : "Desert Sand"]
        ,["color": UIColor.crayolaDingyDungeonColor(), "title" : "Dingy Dungeon"]
        ,["color": UIColor.crayolaDirtColor(), "title" : "Dirt"]
        ,["color": UIColor.crayolaEerieBlackColor(), "title" : "Eerie Black"]
        ,["color": UIColor.crayolaEggplantColor(), "title" : "Eggplant"]
        ,["color": UIColor.crayolaElectricLimeColor(), "title" : "Electric Lime"]
        ,["color": UIColor.crayolaEmeraldColor(), "title" : "Emerald"]
        ,["color": UIColor.crayolaEucalyptusColor(), "title" : "Eucalyptus"]
        ,["color": UIColor.crayolaFernColor(), "title" : "Fern"]
        ,["color": UIColor.crayolaFieryRoseColor(), "title" : "Fiery Rose"]
        ,["color": UIColor.crayolaForestGreenColor(), "title" : "Forest Green"]
        ,["color": UIColor.crayolaFreshAirColor(), "title" : "Fresh Air"]
        ,["color": UIColor.crayolaFrostbiteColor(), "title" : "Frostbite"]
        ,["color": UIColor.crayolaFuchsiaColor(), "title" : "Fuchsia"]
        ,["color": UIColor.crayolaFuzzyWuzzyColor(), "title" : "Fuzzy Wuzzy"]
        ,["color": UIColor.crayolaGargoyleGasColor(), "title" : "Gargoyle Gas"]
        ,["color": UIColor.crayolaGiantsClubColor(), "title" : "Giants Club"]
        ,["color": UIColor.crayolaGlossyGrapeColor(), "title" : "Glossy Grape"]
        ,["color": UIColor.crayolaGoldColor(), "title" : "Gold"]
        ,["color": UIColor.crayolaGoldFusionColor(), "title" : "Gold Fusion"]
        ,["color": UIColor.crayolaGoldenrodColor(), "title" : "Goldenrod"]
        ,["color": UIColor.crayolaGraniteGrayColor(), "title" : "Granite Gray"]
        ,["color": UIColor.crayolaGrannySmithAppleColor(), "title" : "Granny Smith Apple"]
        ,["color": UIColor.crayolaGrapeColor(), "title" : "Grape"]
        ,["color": UIColor.crayolaGrayColor(), "title" : "Gray"]
        ,["color": UIColor.crayolaGreenColor(), "title" : "Green"]
        ,["color": UIColor.crayolaGreenBlueColor(), "title" : "Green Blue"]
        ,["color": UIColor.crayolaGreenLizardColor(), "title" : "Green Lizard"]
        ,["color": UIColor.crayolaGreenSheenColor(), "title" : "Green Sheen"]
        ,["color": UIColor.crayolaGreenYellowColor(), "title" : "Green Yellow"]
        ,["color": UIColor.crayolaHeatWaveColor(), "title" : "Heat Wave"]
        ,["color": UIColor.crayolaHotMagentaColor(), "title" : "Hot Magenta"]
        ,["color": UIColor.crayolaIlluminatingEmeraldColor(), "title" : "Illuminating Emerald"]
        ,["color": UIColor.crayolaInchwormColor(), "title" : "Inchworm"]
        ,["color": UIColor.crayolaIndigoColor(), "title" : "Indigo"]
        ,["color": UIColor.crayolaJadeColor(), "title" : "Jade"]
        ,["color": UIColor.crayolaJasperColor(), "title" : "Jasper"]
        ,["color": UIColor.crayolaJazzberryJamColor(), "title" : "Jazzberry Jam"]
        ,["color": UIColor.crayolaJellyBeanColor(), "title" : "Jelly Bean"]
        ,["color": UIColor.crayolaJungleGreenColor(), "title" : "Jungle Green"]
        ,["color": UIColor.crayolaKeyLimePearlColor(), "title" : "Key Lime Pearl"]
        ,["color": UIColor.crayolaLapisLazuliColor(), "title" : "Lapis Lazuli"]
        ,["color": UIColor.crayolaLaserLemonColor(), "title" : "Laser Lemon"]
        ,["color": UIColor.crayolaLavenderColor(), "title" : "Lavender"]
        ,["color": UIColor.crayolaLeatherJacketColor(), "title" : "Leather Jacket"]
        ,["color": UIColor.crayolaLemonColor(), "title" : "Lemon"]
        ,["color": UIColor.crayolaLemonGlacierColor(), "title" : "Lemon Glacier"]
        ,["color": UIColor.crayolaLemonYellowColor(), "title" : "Lemon Yellow"]
        ,["color": UIColor.crayolaLicoriceColor(), "title" : "Licorice"]
        ,["color": UIColor.crayolaLilacColor(), "title" : "Lilac"]
        ,["color": UIColor.crayolaLilacLusterColor(), "title" : "Lilac Luster"]
        ,["color": UIColor.crayolaLimeColor(), "title" : "Lime"]
        ,["color": UIColor.crayolaLumberColor(), "title" : "Lumber"]
        ,["color": UIColor.crayolaMacaroniCheeseColor(), "title" : "Macaroni Cheese"]
        ,["color": UIColor.crayolaMagentaColor(), "title" : "Magenta"]
        ,["color": UIColor.crayolaMagicMintColor(), "title" : "Magic Mint"]
        ,["color": UIColor.crayolaMagicPotionColor(), "title" : "Magic Potion"]
        ,["color": UIColor.crayolaMahoganyColor(), "title" : "Mahogany"]
        ,["color": UIColor.crayolaMaizeColor(), "title" : "Maize"]
        ,["color": UIColor.crayolaMalachiteColor(), "title" : "Malachite"]
        ,["color": UIColor.crayolaManateeColor(), "title" : "Manatee"]
        ,["color": UIColor.crayolaMandarinPearlColor(), "title" : "Mandarin Pearl"]
        ,["color": UIColor.crayolaMangoTangoColor(), "title" : "Mango Tango"]
        ,["color": UIColor.crayolaMaroonColor(), "title" : "Maroon"]
        ,["color": UIColor.crayolaMauvelousColor(), "title" : "Mauvelous"]
        ,["color": UIColor.crayolaMelonColor(), "title" : "Melon"]
        ,["color": UIColor.crayolaMetallicSeaweedColor(), "title" : "Metallic Seaweed"]
        ,["color": UIColor.crayolaMetallicSunburstColor(), "title" : "Metallic Sunburst"]
        ,["color": UIColor.crayolaMidnightBlueColor(), "title" : "Midnight Blue"]
        ,["color": UIColor.crayolaMidnightPearlColor(), "title" : "Midnight Pearl"]
        ,["color": UIColor.crayolaMistyMossColor(), "title" : "Misty Moss"]
        ,["color": UIColor.crayolaMoonstoneColor(), "title" : "Moonstone"]
        ,["color": UIColor.crayolaMountainMeadowColor(), "title" : "Mountain Meadow"]
        ,["color": UIColor.crayolaMulberryColor(), "title" : "Mulberry"]
        ,["color": UIColor.crayolaMummysTombColor(), "title" : "Mummys Tomb"]
        ,["color": UIColor.crayolaMysticMaroonColor(), "title" : "Mystic Maroon"]
        ,["color": UIColor.crayolaMysticPearlColor(), "title" : "Mystic Pearl"]
        ,["color": UIColor.crayolaNavyBlueColor(), "title" : "Navy Blue"]
        ,["color": UIColor.crayolaNeonCarrotColor(), "title" : "Neon Carrot"]
        ,["color": UIColor.crayolaNewCarColor(), "title" : "New Car"]
        ,["color": UIColor.crayolaOceanBluePearlColor(), "title" : "Ocean Blue Pearl"]
        ,["color": UIColor.crayolaOceanGreenPearlColor(), "title" : "Ocean Green Pearl"]
        ,["color": UIColor.crayolaOgreOdorColor(), "title" : "Ogre Odor"]
        ,["color": UIColor.crayolaOliveGreenColor(), "title" : "Olive Green"]
        ,["color": UIColor.crayolaOnyxColor(), "title" : "Onyx"]
        ,["color": UIColor.crayolaOrangeColor(), "title" : "Orange"]
        ,["color": UIColor.crayolaOrangeRedColor(), "title" : "Orange Red"]
        ,["color": UIColor.crayolaOrangeSodaColor(), "title" : "Orange Soda"]
        ,["color": UIColor.crayolaOrangeYellowColor(), "title" : "Orange Yellow"]
        ,["color": UIColor.crayolaOrchidColor(), "title" : "Orchid"]
        ,["color": UIColor.crayolaOrchidPearlColor(), "title" : "Orchid Pearl"]
        ,["color": UIColor.crayolaOuterSpaceColor(), "title" : "Outer Space"]
        ,["color": UIColor.crayolaOutrageousOrangeColor(), "title" : "Outrageous Orange"]
        ,["color": UIColor.crayolaPacificBlueColor(), "title" : "Pacific Blue"]
        ,["color": UIColor.crayolaPeachColor(), "title" : "Peach"]
        ,["color": UIColor.crayolaPearlyPurpleColor(), "title" : "Pearly Purple"]
        ,["color": UIColor.crayolaPeridotColor(), "title" : "Peridot"]
        ,["color": UIColor.crayolaPeriwinkleColor(), "title" : "Periwinkle"]
        ,["color": UIColor.crayolaPewterBlueColor(), "title" : "Pewter Blue"]
        ,["color": UIColor.crayolaPiggyPinkColor(), "title" : "Piggy Pink"]
        ,["color": UIColor.crayolaPineColor(), "title" : "Pine"]
        ,["color": UIColor.crayolaPineGreenColor(), "title" : "Pine Green"]
        ,["color": UIColor.crayolaPinkFlamingoColor(), "title" : "Pink Flamingo"]
        ,["color": UIColor.crayolaPinkPearlColor(), "title" : "Pink Pearl"]
        ,["color": UIColor.crayolaPinkSherbertColor(), "title" : "Pink Sherbert"]
        ,["color": UIColor.crayolaPixiePowderColor(), "title" : "Pixie Powder"]
        ,["color": UIColor.crayolaPlumColor(), "title" : "Plum"]
        ,["color": UIColor.crayolaPlumpPurpleColor(), "title" : "Plump Purple"]
        ,["color": UIColor.crayolaPolishedPineColor(), "title" : "Polished Pine"]
        ,["color": UIColor.crayolaPrincessPerfumeColor(), "title" : "Princess Perfume"]
        ,["color": UIColor.crayolaPurpleHeartColor(), "title" : "Purple Heart"]
        ,["color": UIColor.crayolaPurpleMountainsMajestyColor(), "title" : "Purple Mountains Majesty"]
        ,["color": UIColor.crayolaPurplePizzazzColor(), "title" : "Purple Pizzazz"]
        ,["color": UIColor.crayolaPurplePlumColor(), "title" : "Purple Plum"]
        ,["color": UIColor.crayolaQuickSilverColor(), "title" : "Quick Silver"]
        ,["color": UIColor.crayolaRadicalRedColor(), "title" : "Radical Red"]
        ,["color": UIColor.crayolaRawSiennaColor(), "title" : "Raw Sienna"]
        ,["color": UIColor.crayolaRawUmberColor(), "title" : "Raw Umber"]
        ,["color": UIColor.crayolaRazzleDazzleRoseColor(), "title" : "Razzle Dazzle Rose"]
        ,["color": UIColor.crayolaRazzmatazzColor(), "title" : "Razzmatazz"]
        ,["color": UIColor.crayolaRazzmicBerryColor(), "title" : "Razzmic Berry"]
        ,["color": UIColor.crayolaRedColor(), "title" : "Red"]
        ,["color": UIColor.crayolaRedOrangeColor(), "title" : "Red Orange"]
        ,["color": UIColor.crayolaRedSalsaColor(), "title" : "Red Salsa"]
        ,["color": UIColor.crayolaRedVioletColor(), "title" : "Red Violet"]
        ,["color": UIColor.crayolaRobinsEggBlueColor(), "title" : "Robins Egg Blue"]
        ,["color": UIColor.crayolaRoseColor(), "title" : "Rose"]
        ,["color": UIColor.crayolaRoseDustColor(), "title" : "Rose Dust"]
        ,["color": UIColor.crayolaRosePearlColor(), "title" : "Rose Pearl"]
        ,["color": UIColor.crayolaRoseQuartzColor(), "title" : "Rose Quartz"]
        ,["color": UIColor.crayolaRoyalPurpleColor(), "title" : "Royal Purple"]
        ,["color": UIColor.crayolaRubyColor(), "title" : "Ruby"]
        ,["color": UIColor.crayolaRustyRedColor(), "title" : "Rusty Red"]
        ,["color": UIColor.crayolaSalmonColor(), "title" : "Salmon"]
        ,["color": UIColor.crayolaSalmonPearlColor(), "title" : "Salmon Pearl"]
        ,["color": UIColor.crayolaSapphireColor(), "title" : "Sapphire"]
        ,["color": UIColor.crayolaSasquatchSocksColor(), "title" : "Sasquatch Socks"]
        ,["color": UIColor.crayolaScarletColor(), "title" : "Scarlet"]
        ,["color": UIColor.crayolaScreaminGreenColor(), "title" : "Screamin Green"]
        ,["color": UIColor.crayolaSeaGreenColor(), "title" : "Sea Green"]
        ,["color": UIColor.crayolaSeaSerpentColor(), "title" : "Sea Serpent"]
        ,["color": UIColor.crayolaSepiaColor(), "title" : "Sepia"]
        ,["color": UIColor.crayolaShadowColor(), "title" : "Shadow"]
        ,["color": UIColor.crayolaShadowBlueColor(), "title" : "Shadow Blue"]
        ,["color": UIColor.crayolaShampooColor(), "title" : "Shampoo"]
        ,["color": UIColor.crayolaShamrockColor(), "title" : "Shamrock"]
        ,["color": UIColor.crayolaSheenGreenColor(), "title" : "Sheen Green"]
        ,["color": UIColor.crayolaShimmeringBlushColor(), "title" : "Shimmering Blush"]
        ,["color": UIColor.crayolaShinyShamrockColor(), "title" : "Shiny Shamrock"]
        ,["color": UIColor.crayolaShockingPinkColor(), "title" : "Shocking Pink"]
        ,["color": UIColor.crayolaSilverColor(), "title" : "Silver"]
        ,["color": UIColor.crayolaSizzlingRedColor(), "title" : "Sizzling Red"]
        ,["color": UIColor.crayolaSizzlingSunriseColor(), "title" : "Sizzling Sunrise"]
        ,["color": UIColor.crayolaSkyBlueColor(), "title" : "Sky Blue"]
        ,["color": UIColor.crayolaSlimyGreenColor(), "title" : "Slimy Green"]
        ,["color": UIColor.crayolaSmashedPumpkinColor(), "title" : "Smashed Pumpkin"]
        ,["color": UIColor.crayolaSmokeColor(), "title" : "Smoke"]
        ,["color": UIColor.crayolaSmokeyTopazColor(), "title" : "Smokey Topaz"]
        ,["color": UIColor.crayolaSoapColor(), "title" : "Soap"]
        ,["color": UIColor.crayolaSonicSilverColor(), "title" : "Sonic Silver"]
        ,["color": UIColor.crayolaSpringFrostColor(), "title" : "Spring Frost"]
        ,["color": UIColor.crayolaSpringGreenColor(), "title" : "Spring Green"]
        ,["color": UIColor.crayolaSteelBlueColor(), "title" : "Steel Blue"]
        ,["color": UIColor.crayolaSteelTealColor(), "title" : "Steel Teal"]
        ,["color": UIColor.crayolaStrawberryColor(), "title" : "Strawberry"]
        ,["color": UIColor.crayolaSugarPlumColor(), "title" : "Sugar Plum"]
        ,["color": UIColor.crayolaSunburntCyclopsColor(), "title" : "Sunburnt Cyclops"]
        ,["color": UIColor.crayolaSunglowColor(), "title" : "Sunglow"]
        ,["color": UIColor.crayolaSunnyPearlColor(), "title" : "Sunny Pearl"]
        ,["color": UIColor.crayolaSunsetOrangeColor(), "title" : "Sunset Orange"]
        ,["color": UIColor.crayolaSunsetPearlColor(), "title" : "Sunset Pearl"]
        ,["color": UIColor.crayolaSweetBrownColor(), "title" : "Sweet Brown"]
        ,["color": UIColor.crayolaTanColor(), "title" : "Tan"]
        ,["color": UIColor.crayolaTartOrangeColor(), "title" : "Tart Orange"]
        ,["color": UIColor.crayolaTealBlueColor(), "title" : "Teal Blue"]
        ,["color": UIColor.crayolaThistleColor(), "title" : "Thistle"]
        ,["color": UIColor.crayolaTickleMePinkColor(), "title" : "Tickle Me Pink"]
        ,["color": UIColor.crayolaTigersEyeColor(), "title" : "Tigers Eye"]
        ,["color": UIColor.crayolaTimberwolfColor(), "title" : "Timberwolf"]
        ,["color": UIColor.crayolaTropicalRainForestColor(), "title" : "Tropical Rain Forest"]
        ,["color": UIColor.crayolaTulipColor(), "title" : "Tulip"]
        ,["color": UIColor.crayolaTumbleweedColor(), "title" : "Tumbleweed"]
        ,["color": UIColor.crayolaTurquoiseBlueColor(), "title" : "Turquoise Blue"]
        ,["color": UIColor.crayolaTurquoisePearlColor(), "title" : "Turquoise Pearl"]
        ,["color": UIColor.crayolaTwilightLavenderColor(), "title" : "Twilight Lavender"]
        ,["color": UIColor.crayolaUnmellowYellowColor(), "title" : "Unmellow Yellow"]
        ,["color": UIColor.crayolaVioletBlueColor(), "title" : "Violet Blue"]
        ,["color": UIColor.crayolaVioletPurpleColor(), "title" : "Violet Purple"]
        ,["color": UIColor.crayolaVioletRedColor(), "title" : "Violet Red"]
        ,["color": UIColor.crayolaVividTangerineColor(), "title" : "Vivid Tangerine"]
        ,["color": UIColor.crayolaVividVioletColor(), "title" : "Vivid Violet"]
        ,["color": UIColor.crayolaWhiteColor(), "title" : "White"]
        ,["color": UIColor.crayolaWildBlueYonderColor(), "title" : "Wild Blue Yonder"]
        ,["color": UIColor.crayolaWildStrawberryColor(), "title" : "Wild Strawberry"]
        ,["color": UIColor.crayolaWildWatermelonColor(), "title" : "Wild Watermelon"]
        ,["color": UIColor.crayolaWinterSkyColor(), "title" : "Winter Sky"]
        ,["color": UIColor.crayolaWinterWizardColor(), "title" : "Winter Wizard"]
        ,["color": UIColor.crayolaWintergreenDreamColor(), "title" : "Wintergreen Dream"]
        ,["color": UIColor.crayolaWisteriaColor(), "title" : "Wisteria"]
        ,["color": UIColor.crayolaYellowColor(), "title" : "Yellow"]
        ,["color": UIColor.crayolaYellowGreenColor(), "title" : "Yellow Green"]
        ,["color": UIColor.crayolaYellowOrangeColor(), "title" : "Yellow Orange"]
        ,["color": UIColor.crayolaYellowSunshineColor(), "title" : "Yellow Sunshine"]]
    */
    var pantoneColors = []
    
    var flatColors = []
}