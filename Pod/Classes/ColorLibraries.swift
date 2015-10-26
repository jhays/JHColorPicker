//
//  ColorLibraries.swift
//  Pods
//
//  Created by Julian Hays on 7/10/15.
//
//

import UIKit
import Foundation
import UIColor_Crayola
import UIColor_Pantone
import ChameleonFramework
import ColorUtils

class ColorLibraries : NSObject {
    
    class func nameForColor(color:UIColor) -> String{
        var name:String?
        for dict in ColorLibraries.crayolaColors {
            if color.isEquivalentToColor(dict["color"] as! UIColor) {
                print("crayola name match")
                name = dict["title"] as? String
            }
        }
        if name == nil {
            for dict in ColorLibraries.pantoneColors {
                if color.isEquivalentToColor(dict["color"] as! UIColor) {
                    print("pantone name match")
                    name = dict["title"] as? String
                }
            }
        }
        if name == nil {
            for dict in ColorLibraries.flatColors {
                if color.isEquivalentToColor(dict["color"] as! UIColor){
                    print("flat name match")
                    name = dict["title"] as? String
                }
            }
        }
        if name == nil {
            print("no name match in color libraries, using hex")
            name = color.toHexString()
        }
        
        return name!
    }
    
    static var crayolaColors:Array<Dictionary<String,AnyObject>>  = [["color": UIColor.crayolaAbsoluteZeroColor(), "title" : "Absolute Zero"]
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
    
    static var pantoneColors:Array<Dictionary<String,AnyObject>> = [["color" : UIColor.pantoneBlackColor() , "title" : "Black"],
        ["color" : UIColor.pantoneBlack2Color() , "title" : "Black2"],
        ["color" : UIColor.pantoneBlack22XColor() , "title" : "Black22X"],
        ["color" : UIColor.pantoneBlack3Color() , "title" : "Black3"],
        ["color" : UIColor.pantoneBlack32XColor() , "title" : "Black32X"],
        ["color" : UIColor.pantoneBlack4Color() , "title" : "Black4"],
        ["color" : UIColor.pantoneBlack42XColor() , "title" : "Black42X"],
        ["color" : UIColor.pantoneBlack5Color() , "title" : "Black5"],
        ["color" : UIColor.pantoneBlack52XColor() , "title" : "Black52X"],
        ["color" : UIColor.pantoneBlack6Color() , "title" : "Black6"],
        ["color" : UIColor.pantoneBlack62XColor() , "title" : "Black62X"],
        ["color" : UIColor.pantoneBlack7Color() , "title" : "Black7"],
        ["color" : UIColor.pantoneBlack72XColor() , "title" : "Black72X"],
        ["color" : UIColor.pantoneBlue072Color() , "title" : "Blue072"],
        ["color" : UIColor.pantoneCoolGray1Color() , "title" : "CoolGray1"],
        ["color" : UIColor.pantoneCoolGray10Color() , "title" : "CoolGray10"],
        ["color" : UIColor.pantoneCoolGray11Color() , "title" : "CoolGray11"],
        ["color" : UIColor.pantoneCoolGray2Color() , "title" : "CoolGray2"],
        ["color" : UIColor.pantoneCoolGray3Color() , "title" : "CoolGray3"],
        ["color" : UIColor.pantoneCoolGray4Color() , "title" : "CoolGray4"],
        ["color" : UIColor.pantoneCoolGray5Color() , "title" : "CoolGray5"],
        ["color" : UIColor.pantoneCoolGray6Color() , "title" : "CoolGray6"],
        ["color" : UIColor.pantoneCoolGray7Color() , "title" : "CoolGray7"],
        ["color" : UIColor.pantoneCoolGray8Color() , "title" : "CoolGray8"],
        ["color" : UIColor.pantoneCoolGray9Color() , "title" : "CoolGray9"],
        ["color" : UIColor.pantoneGreenColor() , "title" : "Green"],
        ["color" : UIColor.pantoneGreen2XColor() , "title" : "Green2X"],
        ["color" : UIColor.pantoneOrange021Color() , "title" : "Orange021"],
        ["color" : UIColor.pantonePMS100Color() , "title" : "PMS100"],
        ["color" : UIColor.pantonePMS101Color() , "title" : "PMS101"],
        ["color" : UIColor.pantonePMS102Color() , "title" : "PMS102"],
        ["color" : UIColor.pantonePMS103Color() , "title" : "PMS103"],
        ["color" : UIColor.pantonePMS104Color() , "title" : "PMS104"],
        ["color" : UIColor.pantonePMS105Color() , "title" : "PMS105"],
        ["color" : UIColor.pantonePMS106Color() , "title" : "PMS106"],
        ["color" : UIColor.pantonePMS107Color() , "title" : "PMS107"],
        ["color" : UIColor.pantonePMS108Color() , "title" : "PMS108"],
        ["color" : UIColor.pantonePMS109Color() , "title" : "PMS109"],
        ["color" : UIColor.pantonePMS110Color() , "title" : "PMS110"],
        ["color" : UIColor.pantonePMS111Color() , "title" : "PMS111"],
        ["color" : UIColor.pantonePMS112Color() , "title" : "PMS112"],
        ["color" : UIColor.pantonePMS113Color() , "title" : "PMS113"],
        ["color" : UIColor.pantonePMS114Color() , "title" : "PMS114"],
        ["color" : UIColor.pantonePMS115Color() , "title" : "PMS115"],
        ["color" : UIColor.pantonePMS116Color() , "title" : "PMS116"],
        ["color" : UIColor.pantonePMS1162XColor() , "title" : "PMS1162X"],
        ["color" : UIColor.pantonePMS117Color() , "title" : "PMS117"],
        ["color" : UIColor.pantonePMS118Color() , "title" : "PMS118"],
        ["color" : UIColor.pantonePMS119Color() , "title" : "PMS119"],
        ["color" : UIColor.pantonePMS120Color() , "title" : "PMS120"],
        ["color" : UIColor.pantonePMS1205Color() , "title" : "PMS1205"],
        ["color" : UIColor.pantonePMS121Color() , "title" : "PMS121"],
        ["color" : UIColor.pantonePMS1215Color() , "title" : "PMS1215"],
        ["color" : UIColor.pantonePMS122Color() , "title" : "PMS122"],
        ["color" : UIColor.pantonePMS1225Color() , "title" : "PMS1225"],
        ["color" : UIColor.pantonePMS123Color() , "title" : "PMS123"],
        ["color" : UIColor.pantonePMS1235Color() , "title" : "PMS1235"],
        ["color" : UIColor.pantonePMS124Color() , "title" : "PMS124"],
        ["color" : UIColor.pantonePMS1245Color() , "title" : "PMS1245"],
        ["color" : UIColor.pantonePMS125Color() , "title" : "PMS125"],
        ["color" : UIColor.pantonePMS1255Color() , "title" : "PMS1255"],
        ["color" : UIColor.pantonePMS1265Color() , "title" : "PMS1265"],
        ["color" : UIColor.pantonePMS127Color() , "title" : "PMS127"],
        ["color" : UIColor.pantonePMS128Color() , "title" : "PMS128"],
        ["color" : UIColor.pantonePMS129Color() , "title" : "PMS129"],
        ["color" : UIColor.pantonePMS130Color() , "title" : "PMS130"],
        ["color" : UIColor.pantonePMS1302XColor() , "title" : "PMS1302X"],
        ["color" : UIColor.pantonePMS131Color() , "title" : "PMS131"],
        ["color" : UIColor.pantonePMS132Color() , "title" : "PMS132"],
        ["color" : UIColor.pantonePMS133Color() , "title" : "PMS133"],
        ["color" : UIColor.pantonePMS134Color() , "title" : "PMS134"],
        ["color" : UIColor.pantonePMS1345Color() , "title" : "PMS1345"],
        ["color" : UIColor.pantonePMS135Color() , "title" : "PMS135"],
        ["color" : UIColor.pantonePMS1355Color() , "title" : "PMS1355"],
        ["color" : UIColor.pantonePMS136Color() , "title" : "PMS136"],
        ["color" : UIColor.pantonePMS1365Color() , "title" : "PMS1365"],
        ["color" : UIColor.pantonePMS137Color() , "title" : "PMS137"],
        ["color" : UIColor.pantonePMS1375Color() , "title" : "PMS1375"],
        ["color" : UIColor.pantonePMS138Color() , "title" : "PMS138"],
        ["color" : UIColor.pantonePMS1385Color() , "title" : "PMS1385"],
        ["color" : UIColor.pantonePMS139Color() , "title" : "PMS139"],
        ["color" : UIColor.pantonePMS1395Color() , "title" : "PMS1395"],
        ["color" : UIColor.pantonePMS140Color() , "title" : "PMS140"],
        ["color" : UIColor.pantonePMS1405Color() , "title" : "PMS1405"],
        ["color" : UIColor.pantonePMS141Color() , "title" : "PMS141"],
        ["color" : UIColor.pantonePMS142Color() , "title" : "PMS142"],
        ["color" : UIColor.pantonePMS143Color() , "title" : "PMS143"],
        ["color" : UIColor.pantonePMS144Color() , "title" : "PMS144"],
        ["color" : UIColor.pantonePMS145Color() , "title" : "PMS145"],
        ["color" : UIColor.pantonePMS146Color() , "title" : "PMS146"],
        ["color" : UIColor.pantonePMS147Color() , "title" : "PMS147"],
        ["color" : UIColor.pantonePMS148Color() , "title" : "PMS148"],
        ["color" : UIColor.pantonePMS1485Color() , "title" : "PMS1485"],
        ["color" : UIColor.pantonePMS149Color() , "title" : "PMS149"],
        ["color" : UIColor.pantonePMS1495Color() , "title" : "PMS1495"],
        ["color" : UIColor.pantonePMS150Color() , "title" : "PMS150"],
        ["color" : UIColor.pantonePMS1505Color() , "title" : "PMS1505"],
        ["color" : UIColor.pantonePMS151Color() , "title" : "PMS151"],
        ["color" : UIColor.pantonePMS152Color() , "title" : "PMS152"],
        ["color" : UIColor.pantonePMS1525Color() , "title" : "PMS1525"],
        ["color" : UIColor.pantonePMS153Color() , "title" : "PMS153"],
        ["color" : UIColor.pantonePMS1535Color() , "title" : "PMS1535"],
        ["color" : UIColor.pantonePMS154Color() , "title" : "PMS154"],
        ["color" : UIColor.pantonePMS1545Color() , "title" : "PMS1545"],
        ["color" : UIColor.pantonePMS155Color() , "title" : "PMS155"],
        ["color" : UIColor.pantonePMS1555Color() , "title" : "PMS1555"],
        ["color" : UIColor.pantonePMS156Color() , "title" : "PMS156"],
        ["color" : UIColor.pantonePMS1565Color() , "title" : "PMS1565"],
        ["color" : UIColor.pantonePMS157Color() , "title" : "PMS157"],
        ["color" : UIColor.pantonePMS1575Color() , "title" : "PMS1575"],
        ["color" : UIColor.pantonePMS158Color() , "title" : "PMS158"],
        ["color" : UIColor.pantonePMS1585Color() , "title" : "PMS1585"],
        ["color" : UIColor.pantonePMS159Color() , "title" : "PMS159"],
        ["color" : UIColor.pantonePMS1595Color() , "title" : "PMS1595"],
        ["color" : UIColor.pantonePMS160Color() , "title" : "PMS160"],
        ["color" : UIColor.pantonePMS1605Color() , "title" : "PMS1605"],
        ["color" : UIColor.pantonePMS161Color() , "title" : "PMS161"],
        ["color" : UIColor.pantonePMS1615Color() , "title" : "PMS1615"],
        ["color" : UIColor.pantonePMS162Color() , "title" : "PMS162"],
        ["color" : UIColor.pantonePMS1625Color() , "title" : "PMS1625"],
        ["color" : UIColor.pantonePMS163Color() , "title" : "PMS163"],
        ["color" : UIColor.pantonePMS1635Color() , "title" : "PMS1635"],
        ["color" : UIColor.pantonePMS164Color() , "title" : "PMS164"],
        ["color" : UIColor.pantonePMS1645Color() , "title" : "PMS1645"],
        ["color" : UIColor.pantonePMS165Color() , "title" : "PMS165"],
        ["color" : UIColor.pantonePMS1652XColor() , "title" : "PMS1652X"],
        ["color" : UIColor.pantonePMS1655Color() , "title" : "PMS1655"],
        ["color" : UIColor.pantonePMS166Color() , "title" : "PMS166"],
        ["color" : UIColor.pantonePMS1665Color() , "title" : "PMS1665"],
        ["color" : UIColor.pantonePMS167Color() , "title" : "PMS167"],
        ["color" : UIColor.pantonePMS1675Color() , "title" : "PMS1675"],
        ["color" : UIColor.pantonePMS168Color() , "title" : "PMS168"],
        ["color" : UIColor.pantonePMS1685Color() , "title" : "PMS1685"],
        ["color" : UIColor.pantonePMS169Color() , "title" : "PMS169"],
        ["color" : UIColor.pantonePMS170Color() , "title" : "PMS170"],
        ["color" : UIColor.pantonePMS171Color() , "title" : "PMS171"],
        ["color" : UIColor.pantonePMS172Color() , "title" : "PMS172"],
        ["color" : UIColor.pantonePMS173Color() , "title" : "PMS173"],
        ["color" : UIColor.pantonePMS174Color() , "title" : "PMS174"],
        ["color" : UIColor.pantonePMS175Color() , "title" : "PMS175"],
        ["color" : UIColor.pantonePMS176Color() , "title" : "PMS176"],
        ["color" : UIColor.pantonePMS1765Color() , "title" : "PMS1765"],
        ["color" : UIColor.pantonePMS1767Color() , "title" : "PMS1767"],
        ["color" : UIColor.pantonePMS177Color() , "title" : "PMS177"],
        ["color" : UIColor.pantonePMS1775Color() , "title" : "PMS1775"],
        ["color" : UIColor.pantonePMS1777Color() , "title" : "PMS1777"],
        ["color" : UIColor.pantonePMS178Color() , "title" : "PMS178"],
        ["color" : UIColor.pantonePMS1785Color() , "title" : "PMS1785"],
        ["color" : UIColor.pantonePMS1787Color() , "title" : "PMS1787"],
        ["color" : UIColor.pantonePMS1788Color() , "title" : "PMS1788"],
        ["color" : UIColor.pantonePMS17882XColor() , "title" : "PMS17882X"],
        ["color" : UIColor.pantonePMS179Color() , "title" : "PMS179"],
        ["color" : UIColor.pantonePMS1795Color() , "title" : "PMS1795"],
        ["color" : UIColor.pantonePMS1797Color() , "title" : "PMS1797"],
        ["color" : UIColor.pantonePMS180Color() , "title" : "PMS180"],
        ["color" : UIColor.pantonePMS1805Color() , "title" : "PMS1805"],
        ["color" : UIColor.pantonePMS1807Color() , "title" : "PMS1807"],
        ["color" : UIColor.pantonePMS181Color() , "title" : "PMS181"],
        ["color" : UIColor.pantonePMS1815Color() , "title" : "PMS1815"],
        ["color" : UIColor.pantonePMS1817Color() , "title" : "PMS1817"],
        ["color" : UIColor.pantonePMS182Color() , "title" : "PMS182"],
        ["color" : UIColor.pantonePMS183Color() , "title" : "PMS183"],
        ["color" : UIColor.pantonePMS184Color() , "title" : "PMS184"],
        ["color" : UIColor.pantonePMS185Color() , "title" : "PMS185"],
        ["color" : UIColor.pantonePMS18522XColor() , "title" : "PMS18522X"],
        ["color" : UIColor.pantonePMS186Color() , "title" : "PMS186"],
        ["color" : UIColor.pantonePMS187Color() , "title" : "PMS187"],
        ["color" : UIColor.pantonePMS188Color() , "title" : "PMS188"],
        ["color" : UIColor.pantonePMS189Color() , "title" : "PMS189"],
        ["color" : UIColor.pantonePMS1895Color() , "title" : "PMS1895"],
        ["color" : UIColor.pantonePMS190Color() , "title" : "PMS190"],
        ["color" : UIColor.pantonePMS1905Color() , "title" : "PMS1905"],
        ["color" : UIColor.pantonePMS191Color() , "title" : "PMS191"],
        ["color" : UIColor.pantonePMS1915Color() , "title" : "PMS1915"],
        ["color" : UIColor.pantonePMS192Color() , "title" : "PMS192"],
        ["color" : UIColor.pantonePMS1925Color() , "title" : "PMS1925"],
        ["color" : UIColor.pantonePMS193Color() , "title" : "PMS193"],
        ["color" : UIColor.pantonePMS1935Color() , "title" : "PMS1935"],
        ["color" : UIColor.pantonePMS194Color() , "title" : "PMS194"],
        ["color" : UIColor.pantonePMS1945Color() , "title" : "PMS1945"],
        ["color" : UIColor.pantonePMS195Color() , "title" : "PMS195"],
        ["color" : UIColor.pantonePMS1955Color() , "title" : "PMS1955"],
        ["color" : UIColor.pantonePMS196Color() , "title" : "PMS196"],
        ["color" : UIColor.pantonePMS197Color() , "title" : "PMS197"],
        ["color" : UIColor.pantonePMS198Color() , "title" : "PMS198"],
        ["color" : UIColor.pantonePMS199Color() , "title" : "PMS199"],
        ["color" : UIColor.pantonePMS200Color() , "title" : "PMS200"],
        ["color" : UIColor.pantonePMS201Color() , "title" : "PMS201"],
        ["color" : UIColor.pantonePMS202Color() , "title" : "PMS202"],
        ["color" : UIColor.pantonePMS203Color() , "title" : "PMS203"],
        ["color" : UIColor.pantonePMS204Color() , "title" : "PMS204"],
        ["color" : UIColor.pantonePMS205Color() , "title" : "PMS205"],
        ["color" : UIColor.pantonePMS206Color() , "title" : "PMS206"],
        ["color" : UIColor.pantonePMS207Color() , "title" : "PMS207"],
        ["color" : UIColor.pantonePMS208Color() , "title" : "PMS208"],
        ["color" : UIColor.pantonePMS209Color() , "title" : "PMS209"],
        ["color" : UIColor.pantonePMS210Color() , "title" : "PMS210"],
        ["color" : UIColor.pantonePMS211Color() , "title" : "PMS211"],
        ["color" : UIColor.pantonePMS212Color() , "title" : "PMS212"],
        ["color" : UIColor.pantonePMS213Color() , "title" : "PMS213"],
        ["color" : UIColor.pantonePMS214Color() , "title" : "PMS214"],
        ["color" : UIColor.pantonePMS215Color() , "title" : "PMS215"],
        ["color" : UIColor.pantonePMS216Color() , "title" : "PMS216"],
        ["color" : UIColor.pantonePMS217Color() , "title" : "PMS217"],
        ["color" : UIColor.pantonePMS218Color() , "title" : "PMS218"],
        ["color" : UIColor.pantonePMS219Color() , "title" : "PMS219"],
        ["color" : UIColor.pantonePMS220Color() , "title" : "PMS220"],
        ["color" : UIColor.pantonePMS221Color() , "title" : "PMS221"],
        ["color" : UIColor.pantonePMS222Color() , "title" : "PMS222"],
        ["color" : UIColor.pantonePMS223Color() , "title" : "PMS223"],
        ["color" : UIColor.pantonePMS224Color() , "title" : "PMS224"],
        ["color" : UIColor.pantonePMS225Color() , "title" : "PMS225"],
        ["color" : UIColor.pantonePMS226Color() , "title" : "PMS226"],
        ["color" : UIColor.pantonePMS227Color() , "title" : "PMS227"],
        ["color" : UIColor.pantonePMS228Color() , "title" : "PMS228"],
        ["color" : UIColor.pantonePMS229Color() , "title" : "PMS229"],
        ["color" : UIColor.pantonePMS230Color() , "title" : "PMS230"],
        ["color" : UIColor.pantonePMS231Color() , "title" : "PMS231"],
        ["color" : UIColor.pantonePMS232Color() , "title" : "PMS232"],
        ["color" : UIColor.pantonePMS233Color() , "title" : "PMS233"],
        ["color" : UIColor.pantonePMS234Color() , "title" : "PMS234"],
        ["color" : UIColor.pantonePMS235Color() , "title" : "PMS235"],
        ["color" : UIColor.pantonePMS236Color() , "title" : "PMS236"],
        ["color" : UIColor.pantonePMS2365Color() , "title" : "PMS2365"],
        ["color" : UIColor.pantonePMS237Color() , "title" : "PMS237"],
        ["color" : UIColor.pantonePMS2375Color() , "title" : "PMS2375"],
        ["color" : UIColor.pantonePMS238Color() , "title" : "PMS238"],
        ["color" : UIColor.pantonePMS2385Color() , "title" : "PMS2385"],
        ["color" : UIColor.pantonePMS239Color() , "title" : "PMS239"],
        ["color" : UIColor.pantonePMS2392XColor() , "title" : "PMS2392X"],
        ["color" : UIColor.pantonePMS2395Color() , "title" : "PMS2395"],
        ["color" : UIColor.pantonePMS240Color() , "title" : "PMS240"],
        ["color" : UIColor.pantonePMS2405Color() , "title" : "PMS2405"],
        ["color" : UIColor.pantonePMS241Color() , "title" : "PMS241"],
        ["color" : UIColor.pantonePMS2415Color() , "title" : "PMS2415"],
        ["color" : UIColor.pantonePMS242Color() , "title" : "PMS242"],
        ["color" : UIColor.pantonePMS2425Color() , "title" : "PMS2425"],
        ["color" : UIColor.pantonePMS243Color() , "title" : "PMS243"],
        ["color" : UIColor.pantonePMS244Color() , "title" : "PMS244"],
        ["color" : UIColor.pantonePMS245Color() , "title" : "PMS245"],
        ["color" : UIColor.pantonePMS246Color() , "title" : "PMS246"],
        ["color" : UIColor.pantonePMS247Color() , "title" : "PMS247"],
        ["color" : UIColor.pantonePMS248Color() , "title" : "PMS248"],
        ["color" : UIColor.pantonePMS249Color() , "title" : "PMS249"],
        ["color" : UIColor.pantonePMS250Color() , "title" : "PMS250"],
        ["color" : UIColor.pantonePMS251Color() , "title" : "PMS251"],
        ["color" : UIColor.pantonePMS252Color() , "title" : "PMS252"],
        ["color" : UIColor.pantonePMS253Color() , "title" : "PMS253"],
        ["color" : UIColor.pantonePMS254Color() , "title" : "PMS254"],
        ["color" : UIColor.pantonePMS255Color() , "title" : "PMS255"],
        ["color" : UIColor.pantonePMS256Color() , "title" : "PMS256"],
        ["color" : UIColor.pantonePMS2562Color() , "title" : "PMS2562"],
        ["color" : UIColor.pantonePMS2563Color() , "title" : "PMS2563"],
        ["color" : UIColor.pantonePMS2567Color() , "title" : "PMS2567"],
        ["color" : UIColor.pantonePMS257Color() , "title" : "PMS257"],
        ["color" : UIColor.pantonePMS2572Color() , "title" : "PMS2572"],
        ["color" : UIColor.pantonePMS2573Color() , "title" : "PMS2573"],
        ["color" : UIColor.pantonePMS2577Color() , "title" : "PMS2577"],
        ["color" : UIColor.pantonePMS258Color() , "title" : "PMS258"],
        ["color" : UIColor.pantonePMS2582Color() , "title" : "PMS2582"],
        ["color" : UIColor.pantonePMS2583Color() , "title" : "PMS2583"],
        ["color" : UIColor.pantonePMS2587Color() , "title" : "PMS2587"],
        ["color" : UIColor.pantonePMS259Color() , "title" : "PMS259"],
        ["color" : UIColor.pantonePMS2592Color() , "title" : "PMS2592"],
        ["color" : UIColor.pantonePMS25922XColor() , "title" : "PMS25922X"],
        ["color" : UIColor.pantonePMS2593Color() , "title" : "PMS2593"],
        ["color" : UIColor.pantonePMS2597Color() , "title" : "PMS2597"],
        ["color" : UIColor.pantonePMS260Color() , "title" : "PMS260"],
        ["color" : UIColor.pantonePMS2602Color() , "title" : "PMS2602"],
        ["color" : UIColor.pantonePMS2603Color() , "title" : "PMS2603"],
        ["color" : UIColor.pantonePMS2607Color() , "title" : "PMS2607"],
        ["color" : UIColor.pantonePMS261Color() , "title" : "PMS261"],
        ["color" : UIColor.pantonePMS2612Color() , "title" : "PMS2612"],
        ["color" : UIColor.pantonePMS2613Color() , "title" : "PMS2613"],
        ["color" : UIColor.pantonePMS2617Color() , "title" : "PMS2617"],
        ["color" : UIColor.pantonePMS262Color() , "title" : "PMS262"],
        ["color" : UIColor.pantonePMS2622Color() , "title" : "PMS2622"],
        ["color" : UIColor.pantonePMS2623Color() , "title" : "PMS2623"],
        ["color" : UIColor.pantonePMS2627Color() , "title" : "PMS2627"],
        ["color" : UIColor.pantonePMS263Color() , "title" : "PMS263"],
        ["color" : UIColor.pantonePMS2635Color() , "title" : "PMS2635"],
        ["color" : UIColor.pantonePMS264Color() , "title" : "PMS264"],
        ["color" : UIColor.pantonePMS2645Color() , "title" : "PMS2645"],
        ["color" : UIColor.pantonePMS265Color() , "title" : "PMS265"],
        ["color" : UIColor.pantonePMS2655Color() , "title" : "PMS2655"],
        ["color" : UIColor.pantonePMS266Color() , "title" : "PMS266"],
        ["color" : UIColor.pantonePMS2665Color() , "title" : "PMS2665"],
        ["color" : UIColor.pantonePMS267Color() , "title" : "PMS267"],
        ["color" : UIColor.pantonePMS268Color() , "title" : "PMS268"],
        ["color" : UIColor.pantonePMS2685Color() , "title" : "PMS2685"],
        ["color" : UIColor.pantonePMS269Color() , "title" : "PMS269"],
        ["color" : UIColor.pantonePMS2695Color() , "title" : "PMS2695"],
        ["color" : UIColor.pantonePMS270Color() , "title" : "PMS270"],
        ["color" : UIColor.pantonePMS2705Color() , "title" : "PMS2705"],
        ["color" : UIColor.pantonePMS2706Color() , "title" : "PMS2706"],
        ["color" : UIColor.pantonePMS2707Color() , "title" : "PMS2707"],
        ["color" : UIColor.pantonePMS2708Color() , "title" : "PMS2708"],
        ["color" : UIColor.pantonePMS271Color() , "title" : "PMS271"],
        ["color" : UIColor.pantonePMS2715Color() , "title" : "PMS2715"],
        ["color" : UIColor.pantonePMS2716Color() , "title" : "PMS2716"],
        ["color" : UIColor.pantonePMS2717Color() , "title" : "PMS2717"],
        ["color" : UIColor.pantonePMS2718Color() , "title" : "PMS2718"],
        ["color" : UIColor.pantonePMS272Color() , "title" : "PMS272"],
        ["color" : UIColor.pantonePMS2725Color() , "title" : "PMS2725"],
        ["color" : UIColor.pantonePMS2726Color() , "title" : "PMS2726"],
        ["color" : UIColor.pantonePMS2727Color() , "title" : "PMS2727"],
        ["color" : UIColor.pantonePMS2728Color() , "title" : "PMS2728"],
        ["color" : UIColor.pantonePMS273Color() , "title" : "PMS273"],
        ["color" : UIColor.pantonePMS2735Color() , "title" : "PMS2735"],
        ["color" : UIColor.pantonePMS2736Color() , "title" : "PMS2736"],
        ["color" : UIColor.pantonePMS2738Color() , "title" : "PMS2738"],
        ["color" : UIColor.pantonePMS274Color() , "title" : "PMS274"],
        ["color" : UIColor.pantonePMS2745Color() , "title" : "PMS2745"],
        ["color" : UIColor.pantonePMS2746Color() , "title" : "PMS2746"],
        ["color" : UIColor.pantonePMS2747Color() , "title" : "PMS2747"],
        ["color" : UIColor.pantonePMS2748Color() , "title" : "PMS2748"],
        ["color" : UIColor.pantonePMS275Color() , "title" : "PMS275"],
        ["color" : UIColor.pantonePMS2755Color() , "title" : "PMS2755"],
        ["color" : UIColor.pantonePMS2756Color() , "title" : "PMS2756"],
        ["color" : UIColor.pantonePMS2757Color() , "title" : "PMS2757"],
        ["color" : UIColor.pantonePMS2758Color() , "title" : "PMS2758"],
        ["color" : UIColor.pantonePMS276Color() , "title" : "PMS276"],
        ["color" : UIColor.pantonePMS2765Color() , "title" : "PMS2765"],
        ["color" : UIColor.pantonePMS2766Color() , "title" : "PMS2766"],
        ["color" : UIColor.pantonePMS2767Color() , "title" : "PMS2767"],
        ["color" : UIColor.pantonePMS2768Color() , "title" : "PMS2768"],
        ["color" : UIColor.pantonePMS277Color() , "title" : "PMS277"],
        ["color" : UIColor.pantonePMS278Color() , "title" : "PMS278"],
        ["color" : UIColor.pantonePMS279Color() , "title" : "PMS279"],
        ["color" : UIColor.pantonePMS280Color() , "title" : "PMS280"],
        ["color" : UIColor.pantonePMS281Color() , "title" : "PMS281"],
        ["color" : UIColor.pantonePMS282Color() , "title" : "PMS282"],
        ["color" : UIColor.pantonePMS283Color() , "title" : "PMS283"],
        ["color" : UIColor.pantonePMS284Color() , "title" : "PMS284"],
        ["color" : UIColor.pantonePMS285Color() , "title" : "PMS285"],
        ["color" : UIColor.pantonePMS286Color() , "title" : "PMS286"],
        ["color" : UIColor.pantonePMS287Color() , "title" : "PMS287"],
        ["color" : UIColor.pantonePMS288Color() , "title" : "PMS288"],
        ["color" : UIColor.pantonePMS289Color() , "title" : "PMS289"],
        ["color" : UIColor.pantonePMS290Color() , "title" : "PMS290"],
        ["color" : UIColor.pantonePMS2905Color() , "title" : "PMS2905"],
        ["color" : UIColor.pantonePMS291Color() , "title" : "PMS291"],
        ["color" : UIColor.pantonePMS2915Color() , "title" : "PMS2915"],
        ["color" : UIColor.pantonePMS292Color() , "title" : "PMS292"],
        ["color" : UIColor.pantonePMS2925Color() , "title" : "PMS2925"],
        ["color" : UIColor.pantonePMS293Color() , "title" : "PMS293"],
        ["color" : UIColor.pantonePMS2935Color() , "title" : "PMS2935"],
        ["color" : UIColor.pantonePMS294Color() , "title" : "PMS294"],
        ["color" : UIColor.pantonePMS2945Color() , "title" : "PMS2945"],
        ["color" : UIColor.pantonePMS295Color() , "title" : "PMS295"],
        ["color" : UIColor.pantonePMS2955Color() , "title" : "PMS2955"],
        ["color" : UIColor.pantonePMS296Color() , "title" : "PMS296"],
        ["color" : UIColor.pantonePMS2965Color() , "title" : "PMS2965"],
        ["color" : UIColor.pantonePMS297Color() , "title" : "PMS297"],
        ["color" : UIColor.pantonePMS2975Color() , "title" : "PMS2975"],
        ["color" : UIColor.pantonePMS298Color() , "title" : "PMS298"],
        ["color" : UIColor.pantonePMS2985Color() , "title" : "PMS2985"],
        ["color" : UIColor.pantonePMS299Color() , "title" : "PMS299"],
        ["color" : UIColor.pantonePMS2992XColor() , "title" : "PMS2992X"],
        ["color" : UIColor.pantonePMS2995Color() , "title" : "PMS2995"],
        ["color" : UIColor.pantonePMS300Color() , "title" : "PMS300"],
        ["color" : UIColor.pantonePMS3005Color() , "title" : "PMS3005"],
        ["color" : UIColor.pantonePMS301Color() , "title" : "PMS301"],
        ["color" : UIColor.pantonePMS3015Color() , "title" : "PMS3015"],
        ["color" : UIColor.pantonePMS302Color() , "title" : "PMS302"],
        ["color" : UIColor.pantonePMS3025Color() , "title" : "PMS3025"],
        ["color" : UIColor.pantonePMS303Color() , "title" : "PMS303"],
        ["color" : UIColor.pantonePMS3035Color() , "title" : "PMS3035"],
        ["color" : UIColor.pantonePMS304Color() , "title" : "PMS304"],
        ["color" : UIColor.pantonePMS305Color() , "title" : "PMS305"],
        ["color" : UIColor.pantonePMS306Color() , "title" : "PMS306"],
        ["color" : UIColor.pantonePMS3062XColor() , "title" : "PMS3062X"],
        ["color" : UIColor.pantonePMS307Color() , "title" : "PMS307"],
        ["color" : UIColor.pantonePMS308Color() , "title" : "PMS308"],
        ["color" : UIColor.pantonePMS309Color() , "title" : "PMS309"],
        ["color" : UIColor.pantonePMS310Color() , "title" : "PMS310"],
        ["color" : UIColor.pantonePMS3105Color() , "title" : "PMS3105"],
        ["color" : UIColor.pantonePMS311Color() , "title" : "PMS311"],
        ["color" : UIColor.pantonePMS3115Color() , "title" : "PMS3115"],
        ["color" : UIColor.pantonePMS312Color() , "title" : "PMS312"],
        ["color" : UIColor.pantonePMS3125Color() , "title" : "PMS3125"],
        ["color" : UIColor.pantonePMS313Color() , "title" : "PMS313"],
        ["color" : UIColor.pantonePMS3135Color() , "title" : "PMS3135"],
        ["color" : UIColor.pantonePMS314Color() , "title" : "PMS314"],
        ["color" : UIColor.pantonePMS3145Color() , "title" : "PMS3145"],
        ["color" : UIColor.pantonePMS315Color() , "title" : "PMS315"],
        ["color" : UIColor.pantonePMS3155Color() , "title" : "PMS3155"],
        ["color" : UIColor.pantonePMS316Color() , "title" : "PMS316"],
        ["color" : UIColor.pantonePMS3165Color() , "title" : "PMS3165"],
        ["color" : UIColor.pantonePMS317Color() , "title" : "PMS317"],
        ["color" : UIColor.pantonePMS318Color() , "title" : "PMS318"],
        ["color" : UIColor.pantonePMS319Color() , "title" : "PMS319"],
        ["color" : UIColor.pantonePMS320Color() , "title" : "PMS320"],
        ["color" : UIColor.pantonePMS3202XColor() , "title" : "PMS3202X"],
        ["color" : UIColor.pantonePMS321Color() , "title" : "PMS321"],
        ["color" : UIColor.pantonePMS322Color() , "title" : "PMS322"],
        ["color" : UIColor.pantonePMS323Color() , "title" : "PMS323"],
        ["color" : UIColor.pantonePMS324Color() , "title" : "PMS324"],
        ["color" : UIColor.pantonePMS3242Color() , "title" : "PMS3242"],
        ["color" : UIColor.pantonePMS3245Color() , "title" : "PMS3245"],
        ["color" : UIColor.pantonePMS3248Color() , "title" : "PMS3248"],
        ["color" : UIColor.pantonePMS325Color() , "title" : "PMS325"],
        ["color" : UIColor.pantonePMS3252Color() , "title" : "PMS3252"],
        ["color" : UIColor.pantonePMS3255Color() , "title" : "PMS3255"],
        ["color" : UIColor.pantonePMS3258Color() , "title" : "PMS3258"],
        ["color" : UIColor.pantonePMS326Color() , "title" : "PMS326"],
        ["color" : UIColor.pantonePMS3262Color() , "title" : "PMS3262"],
        ["color" : UIColor.pantonePMS3265Color() , "title" : "PMS3265"],
        ["color" : UIColor.pantonePMS3268Color() , "title" : "PMS3268"],
        ["color" : UIColor.pantonePMS327Color() , "title" : "PMS327"],
        ["color" : UIColor.pantonePMS3272Color() , "title" : "PMS3272"],
        ["color" : UIColor.pantonePMS3272XColor() , "title" : "PMS3272X"],
        ["color" : UIColor.pantonePMS3275Color() , "title" : "PMS3275"],
        ["color" : UIColor.pantonePMS3278Color() , "title" : "PMS3278"],
        ["color" : UIColor.pantonePMS328Color() , "title" : "PMS328"],
        ["color" : UIColor.pantonePMS3282Color() , "title" : "PMS3282"],
        ["color" : UIColor.pantonePMS3285Color() , "title" : "PMS3285"],
        ["color" : UIColor.pantonePMS3288Color() , "title" : "PMS3288"],
        ["color" : UIColor.pantonePMS329Color() , "title" : "PMS329"],
        ["color" : UIColor.pantonePMS3292Color() , "title" : "PMS3292"],
        ["color" : UIColor.pantonePMS3295Color() , "title" : "PMS3295"],
        ["color" : UIColor.pantonePMS3298Color() , "title" : "PMS3298"],
        ["color" : UIColor.pantonePMS330Color() , "title" : "PMS330"],
        ["color" : UIColor.pantonePMS3302Color() , "title" : "PMS3302"],
        ["color" : UIColor.pantonePMS3305Color() , "title" : "PMS3305"],
        ["color" : UIColor.pantonePMS3308Color() , "title" : "PMS3308"],
        ["color" : UIColor.pantonePMS331Color() , "title" : "PMS331"],
        ["color" : UIColor.pantonePMS332Color() , "title" : "PMS332"],
        ["color" : UIColor.pantonePMS333Color() , "title" : "PMS333"],
        ["color" : UIColor.pantonePMS334Color() , "title" : "PMS334"],
        ["color" : UIColor.pantonePMS335Color() , "title" : "PMS335"],
        ["color" : UIColor.pantonePMS336Color() , "title" : "PMS336"],
        ["color" : UIColor.pantonePMS337Color() , "title" : "PMS337"],
        ["color" : UIColor.pantonePMS3375Color() , "title" : "PMS3375"],
        ["color" : UIColor.pantonePMS338Color() , "title" : "PMS338"],
        ["color" : UIColor.pantonePMS3385Color() , "title" : "PMS3385"],
        ["color" : UIColor.pantonePMS339Color() , "title" : "PMS339"],
        ["color" : UIColor.pantonePMS3395Color() , "title" : "PMS3395"],
        ["color" : UIColor.pantonePMS340Color() , "title" : "PMS340"],
        ["color" : UIColor.pantonePMS3405Color() , "title" : "PMS3405"],
        ["color" : UIColor.pantonePMS341Color() , "title" : "PMS341"],
        ["color" : UIColor.pantonePMS3415Color() , "title" : "PMS3415"],
        ["color" : UIColor.pantonePMS342Color() , "title" : "PMS342"],
        ["color" : UIColor.pantonePMS3425Color() , "title" : "PMS3425"],
        ["color" : UIColor.pantonePMS343Color() , "title" : "PMS343"],
        ["color" : UIColor.pantonePMS3435Color() , "title" : "PMS3435"],
        ["color" : UIColor.pantonePMS344Color() , "title" : "PMS344"],
        ["color" : UIColor.pantonePMS345Color() , "title" : "PMS345"],
        ["color" : UIColor.pantonePMS346Color() , "title" : "PMS346"],
        ["color" : UIColor.pantonePMS347Color() , "title" : "PMS347"],
        ["color" : UIColor.pantonePMS348Color() , "title" : "PMS348"],
        ["color" : UIColor.pantonePMS349Color() , "title" : "PMS349"],
        ["color" : UIColor.pantonePMS350Color() , "title" : "PMS350"],
        ["color" : UIColor.pantonePMS351Color() , "title" : "PMS351"],
        ["color" : UIColor.pantonePMS352Color() , "title" : "PMS352"],
        ["color" : UIColor.pantonePMS353Color() , "title" : "PMS353"],
        ["color" : UIColor.pantonePMS354Color() , "title" : "PMS354"],
        ["color" : UIColor.pantonePMS3542XColor() , "title" : "PMS3542X"],
        ["color" : UIColor.pantonePMS355Color() , "title" : "PMS355"],
        ["color" : UIColor.pantonePMS356Color() , "title" : "PMS356"],
        ["color" : UIColor.pantonePMS357Color() , "title" : "PMS357"],
        ["color" : UIColor.pantonePMS358Color() , "title" : "PMS358"],
        ["color" : UIColor.pantonePMS359Color() , "title" : "PMS359"],
        ["color" : UIColor.pantonePMS360Color() , "title" : "PMS360"],
        ["color" : UIColor.pantonePMS361Color() , "title" : "PMS361"],
        ["color" : UIColor.pantonePMS362Color() , "title" : "PMS362"],
        ["color" : UIColor.pantonePMS363Color() , "title" : "PMS363"],
        ["color" : UIColor.pantonePMS364Color() , "title" : "PMS364"],
        ["color" : UIColor.pantonePMS365Color() , "title" : "PMS365"],
        ["color" : UIColor.pantonePMS366Color() , "title" : "PMS366"],
        ["color" : UIColor.pantonePMS367Color() , "title" : "PMS367"],
        ["color" : UIColor.pantonePMS368Color() , "title" : "PMS368"],
        ["color" : UIColor.pantonePMS3682XColor() , "title" : "PMS3682X"],
        ["color" : UIColor.pantonePMS369Color() , "title" : "PMS369"],
        ["color" : UIColor.pantonePMS370Color() , "title" : "PMS370"],
        ["color" : UIColor.pantonePMS371Color() , "title" : "PMS371"],
        ["color" : UIColor.pantonePMS372Color() , "title" : "PMS372"],
        ["color" : UIColor.pantonePMS373Color() , "title" : "PMS373"],
        ["color" : UIColor.pantonePMS374Color() , "title" : "PMS374"],
        ["color" : UIColor.pantonePMS375Color() , "title" : "PMS375"],
        ["color" : UIColor.pantonePMS3752XColor() , "title" : "PMS3752X"],
        ["color" : UIColor.pantonePMS376Color() , "title" : "PMS376"],
        ["color" : UIColor.pantonePMS377Color() , "title" : "PMS377"],
        ["color" : UIColor.pantonePMS378Color() , "title" : "PMS378"],
        ["color" : UIColor.pantonePMS379Color() , "title" : "PMS379"],
        ["color" : UIColor.pantonePMS380Color() , "title" : "PMS380"],
        ["color" : UIColor.pantonePMS381Color() , "title" : "PMS381"],
        ["color" : UIColor.pantonePMS382Color() , "title" : "PMS382"],
        ["color" : UIColor.pantonePMS3822XColor() , "title" : "PMS3822X"],
        ["color" : UIColor.pantonePMS383Color() , "title" : "PMS383"],
        ["color" : UIColor.pantonePMS384Color() , "title" : "PMS384"],
        ["color" : UIColor.pantonePMS385Color() , "title" : "PMS385"],
        ["color" : UIColor.pantonePMS386Color() , "title" : "PMS386"],
        ["color" : UIColor.pantonePMS387Color() , "title" : "PMS387"],
        ["color" : UIColor.pantonePMS388Color() , "title" : "PMS388"],
        ["color" : UIColor.pantonePMS389Color() , "title" : "PMS389"],
        ["color" : UIColor.pantonePMS390Color() , "title" : "PMS390"],
        ["color" : UIColor.pantonePMS391Color() , "title" : "PMS391"],
        ["color" : UIColor.pantonePMS392Color() , "title" : "PMS392"],
        ["color" : UIColor.pantonePMS393Color() , "title" : "PMS393"],
        ["color" : UIColor.pantonePMS3935Color() , "title" : "PMS3935"],
        ["color" : UIColor.pantonePMS394Color() , "title" : "PMS394"],
        ["color" : UIColor.pantonePMS3945Color() , "title" : "PMS3945"],
        ["color" : UIColor.pantonePMS395Color() , "title" : "PMS395"],
        ["color" : UIColor.pantonePMS3955Color() , "title" : "PMS3955"],
        ["color" : UIColor.pantonePMS396Color() , "title" : "PMS396"],
        ["color" : UIColor.pantonePMS3965Color() , "title" : "PMS3965"],
        ["color" : UIColor.pantonePMS397Color() , "title" : "PMS397"],
        ["color" : UIColor.pantonePMS3975Color() , "title" : "PMS3975"],
        ["color" : UIColor.pantonePMS398Color() , "title" : "PMS398"],
        ["color" : UIColor.pantonePMS3985Color() , "title" : "PMS3985"],
        ["color" : UIColor.pantonePMS399Color() , "title" : "PMS399"],
        ["color" : UIColor.pantonePMS3995Color() , "title" : "PMS3995"],
        ["color" : UIColor.pantonePMS400Color() , "title" : "PMS400"],
        ["color" : UIColor.pantonePMS401Color() , "title" : "PMS401"],
        ["color" : UIColor.pantonePMS402Color() , "title" : "PMS402"],
        ["color" : UIColor.pantonePMS403Color() , "title" : "PMS403"],
        ["color" : UIColor.pantonePMS404Color() , "title" : "PMS404"],
        ["color" : UIColor.pantonePMS405Color() , "title" : "PMS405"],
        ["color" : UIColor.pantonePMS406Color() , "title" : "PMS406"],
        ["color" : UIColor.pantonePMS407Color() , "title" : "PMS407"],
        ["color" : UIColor.pantonePMS408Color() , "title" : "PMS408"],
        ["color" : UIColor.pantonePMS409Color() , "title" : "PMS409"],
        ["color" : UIColor.pantonePMS410Color() , "title" : "PMS410"],
        ["color" : UIColor.pantonePMS411Color() , "title" : "PMS411"],
        ["color" : UIColor.pantonePMS412Color() , "title" : "PMS412"],
        ["color" : UIColor.pantonePMS413Color() , "title" : "PMS413"],
        ["color" : UIColor.pantonePMS414Color() , "title" : "PMS414"],
        ["color" : UIColor.pantonePMS415Color() , "title" : "PMS415"],
        ["color" : UIColor.pantonePMS416Color() , "title" : "PMS416"],
        ["color" : UIColor.pantonePMS417Color() , "title" : "PMS417"],
        ["color" : UIColor.pantonePMS418Color() , "title" : "PMS418"],
        ["color" : UIColor.pantonePMS419Color() , "title" : "PMS419"],
        ["color" : UIColor.pantonePMS420Color() , "title" : "PMS420"],
        ["color" : UIColor.pantonePMS421Color() , "title" : "PMS421"],
        ["color" : UIColor.pantonePMS422Color() , "title" : "PMS422"],
        ["color" : UIColor.pantonePMS423Color() , "title" : "PMS423"],
        ["color" : UIColor.pantonePMS424Color() , "title" : "PMS424"],
        ["color" : UIColor.pantonePMS425Color() , "title" : "PMS425"],
        ["color" : UIColor.pantonePMS426Color() , "title" : "PMS426"],
        ["color" : UIColor.pantonePMS427Color() , "title" : "PMS427"],
        ["color" : UIColor.pantonePMS428Color() , "title" : "PMS428"],
        ["color" : UIColor.pantonePMS429Color() , "title" : "PMS429"],
        ["color" : UIColor.pantonePMS430Color() , "title" : "PMS430"],
        ["color" : UIColor.pantonePMS431Color() , "title" : "PMS431"],
        ["color" : UIColor.pantonePMS432Color() , "title" : "PMS432"],
        ["color" : UIColor.pantonePMS433Color() , "title" : "PMS433"],
        ["color" : UIColor.pantonePMS4332XColor() , "title" : "PMS4332X"],
        ["color" : UIColor.pantonePMS434Color() , "title" : "PMS434"],
        ["color" : UIColor.pantonePMS435Color() , "title" : "PMS435"],
        ["color" : UIColor.pantonePMS436Color() , "title" : "PMS436"],
        ["color" : UIColor.pantonePMS437Color() , "title" : "PMS437"],
        ["color" : UIColor.pantonePMS438Color() , "title" : "PMS438"],
        ["color" : UIColor.pantonePMS439Color() , "title" : "PMS439"],
        ["color" : UIColor.pantonePMS440Color() , "title" : "PMS440"],
        ["color" : UIColor.pantonePMS441Color() , "title" : "PMS441"],
        ["color" : UIColor.pantonePMS442Color() , "title" : "PMS442"],
        ["color" : UIColor.pantonePMS443Color() , "title" : "PMS443"],
        ["color" : UIColor.pantonePMS444Color() , "title" : "PMS444"],
        ["color" : UIColor.pantonePMS445Color() , "title" : "PMS445"],
        ["color" : UIColor.pantonePMS446Color() , "title" : "PMS446"],
        ["color" : UIColor.pantonePMS447Color() , "title" : "PMS447"],
        ["color" : UIColor.pantonePMS448Color() , "title" : "PMS448"],
        ["color" : UIColor.pantonePMS4485Color() , "title" : "PMS4485"],
        ["color" : UIColor.pantonePMS449Color() , "title" : "PMS449"],
        ["color" : UIColor.pantonePMS4495Color() , "title" : "PMS4495"],
        ["color" : UIColor.pantonePMS450Color() , "title" : "PMS450"],
        ["color" : UIColor.pantonePMS4505Color() , "title" : "PMS4505"],
        ["color" : UIColor.pantonePMS451Color() , "title" : "PMS451"],
        ["color" : UIColor.pantonePMS4515Color() , "title" : "PMS4515"],
        ["color" : UIColor.pantonePMS452Color() , "title" : "PMS452"],
        ["color" : UIColor.pantonePMS4525Color() , "title" : "PMS4525"],
        ["color" : UIColor.pantonePMS453Color() , "title" : "PMS453"],
        ["color" : UIColor.pantonePMS4535Color() , "title" : "PMS4535"],
        ["color" : UIColor.pantonePMS454Color() , "title" : "PMS454"],
        ["color" : UIColor.pantonePMS4545Color() , "title" : "PMS4545"],
        ["color" : UIColor.pantonePMS455Color() , "title" : "PMS455"],
        ["color" : UIColor.pantonePMS456Color() , "title" : "PMS456"],
        ["color" : UIColor.pantonePMS457Color() , "title" : "PMS457"],
        ["color" : UIColor.pantonePMS458Color() , "title" : "PMS458"],
        ["color" : UIColor.pantonePMS459Color() , "title" : "PMS459"],
        ["color" : UIColor.pantonePMS460Color() , "title" : "PMS460"],
        ["color" : UIColor.pantonePMS461Color() , "title" : "PMS461"],
        ["color" : UIColor.pantonePMS462Color() , "title" : "PMS462"],
        ["color" : UIColor.pantonePMS4625Color() , "title" : "PMS4625"],
        ["color" : UIColor.pantonePMS463Color() , "title" : "PMS463"],
        ["color" : UIColor.pantonePMS4635Color() , "title" : "PMS4635"],
        ["color" : UIColor.pantonePMS464Color() , "title" : "PMS464"],
        ["color" : UIColor.pantonePMS4642XColor() , "title" : "PMS4642X"],
        ["color" : UIColor.pantonePMS4645Color() , "title" : "PMS4645"],
        ["color" : UIColor.pantonePMS465Color() , "title" : "PMS465"],
        ["color" : UIColor.pantonePMS4655Color() , "title" : "PMS4655"],
        ["color" : UIColor.pantonePMS466Color() , "title" : "PMS466"],
        ["color" : UIColor.pantonePMS4665Color() , "title" : "PMS4665"],
        ["color" : UIColor.pantonePMS467Color() , "title" : "PMS467"],
        ["color" : UIColor.pantonePMS4675Color() , "title" : "PMS4675"],
        ["color" : UIColor.pantonePMS468Color() , "title" : "PMS468"],
        ["color" : UIColor.pantonePMS4685Color() , "title" : "PMS4685"],
        ["color" : UIColor.pantonePMS469Color() , "title" : "PMS469"],
        ["color" : UIColor.pantonePMS4695Color() , "title" : "PMS4695"],
        ["color" : UIColor.pantonePMS4705Color() , "title" : "PMS4705"],
        ["color" : UIColor.pantonePMS4712XColor() , "title" : "PMS4712X"],
        ["color" : UIColor.pantonePMS4715Color() , "title" : "PMS4715"],
        ["color" : UIColor.pantonePMS4725Color() , "title" : "PMS4725"],
        ["color" : UIColor.pantonePMS4735Color() , "title" : "PMS4735"],
        ["color" : UIColor.pantonePMS4745Color() , "title" : "PMS4745"],
        ["color" : UIColor.pantonePMS4755Color() , "title" : "PMS4755"],
        ["color" : UIColor.pantonePMS476Color() , "title" : "PMS476"],
        ["color" : UIColor.pantonePMS477Color() , "title" : "PMS477"],
        ["color" : UIColor.pantonePMS478Color() , "title" : "PMS478"],
        ["color" : UIColor.pantonePMS479Color() , "title" : "PMS479"],
        ["color" : UIColor.pantonePMS480Color() , "title" : "PMS480"],
        ["color" : UIColor.pantonePMS481Color() , "title" : "PMS481"],
        ["color" : UIColor.pantonePMS482Color() , "title" : "PMS482"],
        ["color" : UIColor.pantonePMS483Color() , "title" : "PMS483"],
        ["color" : UIColor.pantonePMS484Color() , "title" : "PMS484"],
        ["color" : UIColor.pantonePMS485Color() , "title" : "PMS485"],
        ["color" : UIColor.pantonePMS4852XColor() , "title" : "PMS4852X"],
        ["color" : UIColor.pantonePMS486Color() , "title" : "PMS486"],
        ["color" : UIColor.pantonePMS487Color() , "title" : "PMS487"],
        ["color" : UIColor.pantonePMS488Color() , "title" : "PMS488"],
        ["color" : UIColor.pantonePMS489Color() , "title" : "PMS489"],
        ["color" : UIColor.pantonePMS490Color() , "title" : "PMS490"],
        ["color" : UIColor.pantonePMS491Color() , "title" : "PMS491"],
        ["color" : UIColor.pantonePMS492Color() , "title" : "PMS492"],
        ["color" : UIColor.pantonePMS493Color() , "title" : "PMS493"],
        ["color" : UIColor.pantonePMS494Color() , "title" : "PMS494"],
        ["color" : UIColor.pantonePMS495Color() , "title" : "PMS495"],
        ["color" : UIColor.pantonePMS496Color() , "title" : "PMS496"],
        ["color" : UIColor.pantonePMS497Color() , "title" : "PMS497"],
        ["color" : UIColor.pantonePMS4975Color() , "title" : "PMS4975"],
        ["color" : UIColor.pantonePMS498Color() , "title" : "PMS498"],
        ["color" : UIColor.pantonePMS4985Color() , "title" : "PMS4985"],
        ["color" : UIColor.pantonePMS499Color() , "title" : "PMS499"],
        ["color" : UIColor.pantonePMS4995Color() , "title" : "PMS4995"],
        ["color" : UIColor.pantonePMS500Color() , "title" : "PMS500"],
        ["color" : UIColor.pantonePMS5005Color() , "title" : "PMS5005"],
        ["color" : UIColor.pantonePMS501Color() , "title" : "PMS501"],
        ["color" : UIColor.pantonePMS5015Color() , "title" : "PMS5015"],
        ["color" : UIColor.pantonePMS502Color() , "title" : "PMS502"],
        ["color" : UIColor.pantonePMS5025Color() , "title" : "PMS5025"],
        ["color" : UIColor.pantonePMS503Color() , "title" : "PMS503"],
        ["color" : UIColor.pantonePMS5035Color() , "title" : "PMS5035"],
        ["color" : UIColor.pantonePMS504Color() , "title" : "PMS504"],
        ["color" : UIColor.pantonePMS505Color() , "title" : "PMS505"],
        ["color" : UIColor.pantonePMS506Color() , "title" : "PMS506"],
        ["color" : UIColor.pantonePMS507Color() , "title" : "PMS507"],
        ["color" : UIColor.pantonePMS508Color() , "title" : "PMS508"],
        ["color" : UIColor.pantonePMS509Color() , "title" : "PMS509"],
        ["color" : UIColor.pantonePMS510Color() , "title" : "PMS510"],
        ["color" : UIColor.pantonePMS511Color() , "title" : "PMS511"],
        ["color" : UIColor.pantonePMS5115Color() , "title" : "PMS5115"],
        ["color" : UIColor.pantonePMS512Color() , "title" : "PMS512"],
        ["color" : UIColor.pantonePMS5125Color() , "title" : "PMS5125"],
        ["color" : UIColor.pantonePMS513Color() , "title" : "PMS513"],
        ["color" : UIColor.pantonePMS5135Color() , "title" : "PMS5135"],
        ["color" : UIColor.pantonePMS514Color() , "title" : "PMS514"],
        ["color" : UIColor.pantonePMS5145Color() , "title" : "PMS5145"],
        ["color" : UIColor.pantonePMS515Color() , "title" : "PMS515"],
        ["color" : UIColor.pantonePMS5155Color() , "title" : "PMS5155"],
        ["color" : UIColor.pantonePMS516Color() , "title" : "PMS516"],
        ["color" : UIColor.pantonePMS5165Color() , "title" : "PMS5165"],
        ["color" : UIColor.pantonePMS517Color() , "title" : "PMS517"],
        ["color" : UIColor.pantonePMS5175Color() , "title" : "PMS5175"],
        ["color" : UIColor.pantonePMS518Color() , "title" : "PMS518"],
        ["color" : UIColor.pantonePMS5185Color() , "title" : "PMS5185"],
        ["color" : UIColor.pantonePMS519Color() , "title" : "PMS519"],
        ["color" : UIColor.pantonePMS5195Color() , "title" : "PMS5195"],
        ["color" : UIColor.pantonePMS520Color() , "title" : "PMS520"],
        ["color" : UIColor.pantonePMS5205Color() , "title" : "PMS5205"],
        ["color" : UIColor.pantonePMS521Color() , "title" : "PMS521"],
        ["color" : UIColor.pantonePMS5215Color() , "title" : "PMS5215"],
        ["color" : UIColor.pantonePMS522Color() , "title" : "PMS522"],
        ["color" : UIColor.pantonePMS5225Color() , "title" : "PMS5225"],
        ["color" : UIColor.pantonePMS523Color() , "title" : "PMS523"],
        ["color" : UIColor.pantonePMS5235Color() , "title" : "PMS5235"],
        ["color" : UIColor.pantonePMS524Color() , "title" : "PMS524"],
        ["color" : UIColor.pantonePMS5245Color() , "title" : "PMS5245"],
        ["color" : UIColor.pantonePMS525Color() , "title" : "PMS525"],
        ["color" : UIColor.pantonePMS5255Color() , "title" : "PMS5255"],
        ["color" : UIColor.pantonePMS526Color() , "title" : "PMS526"],
        ["color" : UIColor.pantonePMS5265Color() , "title" : "PMS5265"],
        ["color" : UIColor.pantonePMS527Color() , "title" : "PMS527"],
        ["color" : UIColor.pantonePMS5275Color() , "title" : "PMS5275"],
        ["color" : UIColor.pantonePMS528Color() , "title" : "PMS528"],
        ["color" : UIColor.pantonePMS5285Color() , "title" : "PMS5285"],
        ["color" : UIColor.pantonePMS529Color() , "title" : "PMS529"],
        ["color" : UIColor.pantonePMS5295Color() , "title" : "PMS5295"],
        ["color" : UIColor.pantonePMS530Color() , "title" : "PMS530"],
        ["color" : UIColor.pantonePMS5305Color() , "title" : "PMS5305"],
        ["color" : UIColor.pantonePMS531Color() , "title" : "PMS531"],
        ["color" : UIColor.pantonePMS5315Color() , "title" : "PMS5315"],
        ["color" : UIColor.pantonePMS532Color() , "title" : "PMS532"],
        ["color" : UIColor.pantonePMS533Color() , "title" : "PMS533"],
        ["color" : UIColor.pantonePMS534Color() , "title" : "PMS534"],
        ["color" : UIColor.pantonePMS535Color() , "title" : "PMS535"],
        ["color" : UIColor.pantonePMS536Color() , "title" : "PMS536"],
        ["color" : UIColor.pantonePMS537Color() , "title" : "PMS537"],
        ["color" : UIColor.pantonePMS538Color() , "title" : "PMS538"],
        ["color" : UIColor.pantonePMS539Color() , "title" : "PMS539"],
        ["color" : UIColor.pantonePMS5395Color() , "title" : "PMS5395"],
        ["color" : UIColor.pantonePMS540Color() , "title" : "PMS540"],
        ["color" : UIColor.pantonePMS5405Color() , "title" : "PMS5405"],
        ["color" : UIColor.pantonePMS541Color() , "title" : "PMS541"],
        ["color" : UIColor.pantonePMS5415Color() , "title" : "PMS5415"],
        ["color" : UIColor.pantonePMS542Color() , "title" : "PMS542"],
        ["color" : UIColor.pantonePMS5425Color() , "title" : "PMS5425"],
        ["color" : UIColor.pantonePMS543Color() , "title" : "PMS543"],
        ["color" : UIColor.pantonePMS5435Color() , "title" : "PMS5435"],
        ["color" : UIColor.pantonePMS544Color() , "title" : "PMS544"],
        ["color" : UIColor.pantonePMS5445Color() , "title" : "PMS5445"],
        ["color" : UIColor.pantonePMS545Color() , "title" : "PMS545"],
        ["color" : UIColor.pantonePMS5455Color() , "title" : "PMS5455"],
        ["color" : UIColor.pantonePMS546Color() , "title" : "PMS546"],
        ["color" : UIColor.pantonePMS5463Color() , "title" : "PMS5463"],
        ["color" : UIColor.pantonePMS5467Color() , "title" : "PMS5467"],
        ["color" : UIColor.pantonePMS547Color() , "title" : "PMS547"],
        ["color" : UIColor.pantonePMS5473Color() , "title" : "PMS5473"],
        ["color" : UIColor.pantonePMS5477Color() , "title" : "PMS5477"],
        ["color" : UIColor.pantonePMS548Color() , "title" : "PMS548"],
        ["color" : UIColor.pantonePMS5483Color() , "title" : "PMS5483"],
        ["color" : UIColor.pantonePMS5487Color() , "title" : "PMS5487"],
        ["color" : UIColor.pantonePMS549Color() , "title" : "PMS549"],
        ["color" : UIColor.pantonePMS5493Color() , "title" : "PMS5493"],
        ["color" : UIColor.pantonePMS5497Color() , "title" : "PMS5497"],
        ["color" : UIColor.pantonePMS550Color() , "title" : "PMS550"],
        ["color" : UIColor.pantonePMS5503Color() , "title" : "PMS5503"],
        ["color" : UIColor.pantonePMS5507Color() , "title" : "PMS5507"],
        ["color" : UIColor.pantonePMS551Color() , "title" : "PMS551"],
        ["color" : UIColor.pantonePMS5513Color() , "title" : "PMS5513"],
        ["color" : UIColor.pantonePMS5517Color() , "title" : "PMS5517"],
        ["color" : UIColor.pantonePMS552Color() , "title" : "PMS552"],
        ["color" : UIColor.pantonePMS5523Color() , "title" : "PMS5523"],
        ["color" : UIColor.pantonePMS5527Color() , "title" : "PMS5527"],
        ["color" : UIColor.pantonePMS553Color() , "title" : "PMS553"],
        ["color" : UIColor.pantonePMS5535Color() , "title" : "PMS5535"],
        ["color" : UIColor.pantonePMS554Color() , "title" : "PMS554"],
        ["color" : UIColor.pantonePMS5545Color() , "title" : "PMS5545"],
        ["color" : UIColor.pantonePMS555Color() , "title" : "PMS555"],
        ["color" : UIColor.pantonePMS5555Color() , "title" : "PMS5555"],
        ["color" : UIColor.pantonePMS556Color() , "title" : "PMS556"],
        ["color" : UIColor.pantonePMS5565Color() , "title" : "PMS5565"],
        ["color" : UIColor.pantonePMS557Color() , "title" : "PMS557"],
        ["color" : UIColor.pantonePMS5575Color() , "title" : "PMS5575"],
        ["color" : UIColor.pantonePMS558Color() , "title" : "PMS558"],
        ["color" : UIColor.pantonePMS5585Color() , "title" : "PMS5585"],
        ["color" : UIColor.pantonePMS559Color() , "title" : "PMS559"],
        ["color" : UIColor.pantonePMS5595Color() , "title" : "PMS5595"],
        ["color" : UIColor.pantonePMS560Color() , "title" : "PMS560"],
        ["color" : UIColor.pantonePMS5605Color() , "title" : "PMS5605"],
        ["color" : UIColor.pantonePMS561Color() , "title" : "PMS561"],
        ["color" : UIColor.pantonePMS5615Color() , "title" : "PMS5615"],
        ["color" : UIColor.pantonePMS562Color() , "title" : "PMS562"],
        ["color" : UIColor.pantonePMS5625Color() , "title" : "PMS5625"],
        ["color" : UIColor.pantonePMS563Color() , "title" : "PMS563"],
        ["color" : UIColor.pantonePMS5635Color() , "title" : "PMS5635"],
        ["color" : UIColor.pantonePMS564Color() , "title" : "PMS564"],
        ["color" : UIColor.pantonePMS5645Color() , "title" : "PMS5645"],
        ["color" : UIColor.pantonePMS565Color() , "title" : "PMS565"],
        ["color" : UIColor.pantonePMS5655Color() , "title" : "PMS5655"],
        ["color" : UIColor.pantonePMS566Color() , "title" : "PMS566"],
        ["color" : UIColor.pantonePMS568Color() , "title" : "PMS568"],
        ["color" : UIColor.pantonePMS569Color() , "title" : "PMS569"],
        ["color" : UIColor.pantonePMS570Color() , "title" : "PMS570"],
        ["color" : UIColor.pantonePMS571Color() , "title" : "PMS571"],
        ["color" : UIColor.pantonePMS572Color() , "title" : "PMS572"],
        ["color" : UIColor.pantonePMS573Color() , "title" : "PMS573"],
        ["color" : UIColor.pantonePMS574Color() , "title" : "PMS574"],
        ["color" : UIColor.pantonePMS5743Color() , "title" : "PMS5743"],
        ["color" : UIColor.pantonePMS5747Color() , "title" : "PMS5747"],
        ["color" : UIColor.pantonePMS575Color() , "title" : "PMS575"],
        ["color" : UIColor.pantonePMS5753Color() , "title" : "PMS5753"],
        ["color" : UIColor.pantonePMS5757Color() , "title" : "PMS5757"],
        ["color" : UIColor.pantonePMS576Color() , "title" : "PMS576"],
        ["color" : UIColor.pantonePMS5763Color() , "title" : "PMS5763"],
        ["color" : UIColor.pantonePMS5767Color() , "title" : "PMS5767"],
        ["color" : UIColor.pantonePMS577Color() , "title" : "PMS577"],
        ["color" : UIColor.pantonePMS5773Color() , "title" : "PMS5773"],
        ["color" : UIColor.pantonePMS5777Color() , "title" : "PMS5777"],
        ["color" : UIColor.pantonePMS578Color() , "title" : "PMS578"],
        ["color" : UIColor.pantonePMS5783Color() , "title" : "PMS5783"],
        ["color" : UIColor.pantonePMS5787Color() , "title" : "PMS5787"],
        ["color" : UIColor.pantonePMS579Color() , "title" : "PMS579"],
        ["color" : UIColor.pantonePMS5793Color() , "title" : "PMS5793"],
        ["color" : UIColor.pantonePMS5797Color() , "title" : "PMS5797"],
        ["color" : UIColor.pantonePMS580Color() , "title" : "PMS580"],
        ["color" : UIColor.pantonePMS5807Color() , "title" : "PMS5807"],
        ["color" : UIColor.pantonePMS581Color() , "title" : "PMS581"],
        ["color" : UIColor.pantonePMS5815Color() , "title" : "PMS5815"],
        ["color" : UIColor.pantonePMS582Color() , "title" : "PMS582"],
        ["color" : UIColor.pantonePMS5825Color() , "title" : "PMS5825"],
        ["color" : UIColor.pantonePMS583Color() , "title" : "PMS583"],
        ["color" : UIColor.pantonePMS5835Color() , "title" : "PMS5835"],
        ["color" : UIColor.pantonePMS584Color() , "title" : "PMS584"],
        ["color" : UIColor.pantonePMS5845Color() , "title" : "PMS5845"],
        ["color" : UIColor.pantonePMS585Color() , "title" : "PMS585"],
        ["color" : UIColor.pantonePMS5855Color() , "title" : "PMS5855"],
        ["color" : UIColor.pantonePMS586Color() , "title" : "PMS586"],
        ["color" : UIColor.pantonePMS5865Color() , "title" : "PMS5865"],
        ["color" : UIColor.pantonePMS587Color() , "title" : "PMS587"],
        ["color" : UIColor.pantonePMS5875Color() , "title" : "PMS5875"],
        ["color" : UIColor.pantonePMS600Color() , "title" : "PMS600"],
        ["color" : UIColor.pantonePMS601Color() , "title" : "PMS601"],
        ["color" : UIColor.pantonePMS602Color() , "title" : "PMS602"],
        ["color" : UIColor.pantonePMS603Color() , "title" : "PMS603"],
        ["color" : UIColor.pantonePMS604Color() , "title" : "PMS604"],
        ["color" : UIColor.pantonePMS605Color() , "title" : "PMS605"],
        ["color" : UIColor.pantonePMS606Color() , "title" : "PMS606"],
        ["color" : UIColor.pantonePMS607Color() , "title" : "PMS607"],
        ["color" : UIColor.pantonePMS608Color() , "title" : "PMS608"],
        ["color" : UIColor.pantonePMS609Color() , "title" : "PMS609"],
        ["color" : UIColor.pantonePMS610Color() , "title" : "PMS610"],
        ["color" : UIColor.pantonePMS611Color() , "title" : "PMS611"],
        ["color" : UIColor.pantonePMS612Color() , "title" : "PMS612"],
        ["color" : UIColor.pantonePMS613Color() , "title" : "PMS613"],
        ["color" : UIColor.pantonePMS614Color() , "title" : "PMS614"],
        ["color" : UIColor.pantonePMS615Color() , "title" : "PMS615"],
        ["color" : UIColor.pantonePMS616Color() , "title" : "PMS616"],
        ["color" : UIColor.pantonePMS617Color() , "title" : "PMS617"],
        ["color" : UIColor.pantonePMS618Color() , "title" : "PMS618"],
        ["color" : UIColor.pantonePMS619Color() , "title" : "PMS619"],
        ["color" : UIColor.pantonePMS620Color() , "title" : "PMS620"],
        ["color" : UIColor.pantonePMS621Color() , "title" : "PMS621"],
        ["color" : UIColor.pantonePMS622Color() , "title" : "PMS622"],
        ["color" : UIColor.pantonePMS623Color() , "title" : "PMS623"],
        ["color" : UIColor.pantonePMS624Color() , "title" : "PMS624"],
        ["color" : UIColor.pantonePMS625Color() , "title" : "PMS625"],
        ["color" : UIColor.pantonePMS626Color() , "title" : "PMS626"],
        ["color" : UIColor.pantonePMS627Color() , "title" : "PMS627"],
        ["color" : UIColor.pantonePMS628Color() , "title" : "PMS628"],
        ["color" : UIColor.pantonePMS629Color() , "title" : "PMS629"],
        ["color" : UIColor.pantonePMS630Color() , "title" : "PMS630"],
        ["color" : UIColor.pantonePMS631Color() , "title" : "PMS631"],
        ["color" : UIColor.pantonePMS632Color() , "title" : "PMS632"],
        ["color" : UIColor.pantonePMS633Color() , "title" : "PMS633"],
        ["color" : UIColor.pantonePMS634Color() , "title" : "PMS634"],
        ["color" : UIColor.pantonePMS635Color() , "title" : "PMS635"],
        ["color" : UIColor.pantonePMS636Color() , "title" : "PMS636"],
        ["color" : UIColor.pantonePMS637Color() , "title" : "PMS637"],
        ["color" : UIColor.pantonePMS638Color() , "title" : "PMS638"],
        ["color" : UIColor.pantonePMS639Color() , "title" : "PMS639"],
        ["color" : UIColor.pantonePMS640Color() , "title" : "PMS640"],
        ["color" : UIColor.pantonePMS641Color() , "title" : "PMS641"],
        ["color" : UIColor.pantonePMS642Color() , "title" : "PMS642"],
        ["color" : UIColor.pantonePMS643Color() , "title" : "PMS643"],
        ["color" : UIColor.pantonePMS644Color() , "title" : "PMS644"],
        ["color" : UIColor.pantonePMS645Color() , "title" : "PMS645"],
        ["color" : UIColor.pantonePMS646Color() , "title" : "PMS646"],
        ["color" : UIColor.pantonePMS647Color() , "title" : "PMS647"],
        ["color" : UIColor.pantonePMS648Color() , "title" : "PMS648"],
        ["color" : UIColor.pantonePMS649Color() , "title" : "PMS649"],
        ["color" : UIColor.pantonePMS650Color() , "title" : "PMS650"],
        ["color" : UIColor.pantonePMS651Color() , "title" : "PMS651"],
        ["color" : UIColor.pantonePMS652Color() , "title" : "PMS652"],
        ["color" : UIColor.pantonePMS653Color() , "title" : "PMS653"],
        ["color" : UIColor.pantonePMS654Color() , "title" : "PMS654"],
        ["color" : UIColor.pantonePMS655Color() , "title" : "PMS655"],
        ["color" : UIColor.pantonePMS656Color() , "title" : "PMS656"],
        ["color" : UIColor.pantonePMS657Color() , "title" : "PMS657"],
        ["color" : UIColor.pantonePMS658Color() , "title" : "PMS658"],
        ["color" : UIColor.pantonePMS659Color() , "title" : "PMS659"],
        ["color" : UIColor.pantonePMS660Color() , "title" : "PMS660"],
        ["color" : UIColor.pantonePMS661Color() , "title" : "PMS661"],
        ["color" : UIColor.pantonePMS662Color() , "title" : "PMS662"],
        ["color" : UIColor.pantonePMS663Color() , "title" : "PMS663"],
        ["color" : UIColor.pantonePMS664Color() , "title" : "PMS664"],
        ["color" : UIColor.pantonePMS665Color() , "title" : "PMS665"],
        ["color" : UIColor.pantonePMS666Color() , "title" : "PMS666"],
        ["color" : UIColor.pantonePMS667Color() , "title" : "PMS667"],
        ["color" : UIColor.pantonePMS668Color() , "title" : "PMS668"],
        ["color" : UIColor.pantonePMS669Color() , "title" : "PMS669"],
        ["color" : UIColor.pantonePMS670Color() , "title" : "PMS670"],
        ["color" : UIColor.pantonePMS671Color() , "title" : "PMS671"],
        ["color" : UIColor.pantonePMS672Color() , "title" : "PMS672"],
        ["color" : UIColor.pantonePMS673Color() , "title" : "PMS673"],
        ["color" : UIColor.pantonePMS674Color() , "title" : "PMS674"],
        ["color" : UIColor.pantonePMS675Color() , "title" : "PMS675"],
        ["color" : UIColor.pantonePMS676Color() , "title" : "PMS676"],
        ["color" : UIColor.pantonePMS677Color() , "title" : "PMS677"],
        ["color" : UIColor.pantonePMS678Color() , "title" : "PMS678"],
        ["color" : UIColor.pantonePMS679Color() , "title" : "PMS679"],
        ["color" : UIColor.pantonePMS680Color() , "title" : "PMS680"],
        ["color" : UIColor.pantonePMS681Color() , "title" : "PMS681"],
        ["color" : UIColor.pantonePMS682Color() , "title" : "PMS682"],
        ["color" : UIColor.pantonePMS683Color() , "title" : "PMS683"],
        ["color" : UIColor.pantonePMS684Color() , "title" : "PMS684"],
        ["color" : UIColor.pantonePMS685Color() , "title" : "PMS685"],
        ["color" : UIColor.pantonePMS686Color() , "title" : "PMS686"],
        ["color" : UIColor.pantonePMS687Color() , "title" : "PMS687"],
        ["color" : UIColor.pantonePMS688Color() , "title" : "PMS688"],
        ["color" : UIColor.pantonePMS689Color() , "title" : "PMS689"],
        ["color" : UIColor.pantonePMS690Color() , "title" : "PMS690"],
        ["color" : UIColor.pantonePMS691Color() , "title" : "PMS691"],
        ["color" : UIColor.pantonePMS692Color() , "title" : "PMS692"],
        ["color" : UIColor.pantonePMS693Color() , "title" : "PMS693"],
        ["color" : UIColor.pantonePMS694Color() , "title" : "PMS694"],
        ["color" : UIColor.pantonePMS695Color() , "title" : "PMS695"],
        ["color" : UIColor.pantonePMS696Color() , "title" : "PMS696"],
        ["color" : UIColor.pantonePMS697Color() , "title" : "PMS697"],
        ["color" : UIColor.pantonePMS698Color() , "title" : "PMS698"],
        ["color" : UIColor.pantonePMS699Color() , "title" : "PMS699"],
        ["color" : UIColor.pantonePMS700Color() , "title" : "PMS700"],
        ["color" : UIColor.pantonePMS701Color() , "title" : "PMS701"],
        ["color" : UIColor.pantonePMS702Color() , "title" : "PMS702"],
        ["color" : UIColor.pantonePMS703Color() , "title" : "PMS703"],
        ["color" : UIColor.pantonePMS704Color() , "title" : "PMS704"],
        ["color" : UIColor.pantonePMS705Color() , "title" : "PMS705"],
        ["color" : UIColor.pantonePMS706Color() , "title" : "PMS706"],
        ["color" : UIColor.pantonePMS707Color() , "title" : "PMS707"],
        ["color" : UIColor.pantonePMS708Color() , "title" : "PMS708"],
        ["color" : UIColor.pantonePMS709Color() , "title" : "PMS709"],
        ["color" : UIColor.pantonePMS710Color() , "title" : "PMS710"],
        ["color" : UIColor.pantonePMS711Color() , "title" : "PMS711"],
        ["color" : UIColor.pantonePMS712Color() , "title" : "PMS712"],
        ["color" : UIColor.pantonePMS713Color() , "title" : "PMS713"],
        ["color" : UIColor.pantonePMS714Color() , "title" : "PMS714"],
        ["color" : UIColor.pantonePMS715Color() , "title" : "PMS715"],
        ["color" : UIColor.pantonePMS716Color() , "title" : "PMS716"],
        ["color" : UIColor.pantonePMS717Color() , "title" : "PMS717"],
        ["color" : UIColor.pantonePMS718Color() , "title" : "PMS718"],
        ["color" : UIColor.pantonePMS719Color() , "title" : "PMS719"],
        ["color" : UIColor.pantonePMS720Color() , "title" : "PMS720"],
        ["color" : UIColor.pantonePMS721Color() , "title" : "PMS721"],
        ["color" : UIColor.pantonePMS722Color() , "title" : "PMS722"],
        ["color" : UIColor.pantonePMS723Color() , "title" : "PMS723"],
        ["color" : UIColor.pantonePMS724Color() , "title" : "PMS724"],
        ["color" : UIColor.pantonePMS725Color() , "title" : "PMS725"],
        ["color" : UIColor.pantonePMS726Color() , "title" : "PMS726"],
        ["color" : UIColor.pantonePMS727Color() , "title" : "PMS727"],
        ["color" : UIColor.pantonePMS728Color() , "title" : "PMS728"],
        ["color" : UIColor.pantonePMS729Color() , "title" : "PMS729"],
        ["color" : UIColor.pantonePMS730Color() , "title" : "PMS730"],
        ["color" : UIColor.pantonePMS731Color() , "title" : "PMS731"],
        ["color" : UIColor.pantonePMS732Color() , "title" : "PMS732"],
        ["color" : UIColor.pantonePMS801Color() , "title" : "PMS801"],
        ["color" : UIColor.pantonePMS8012XColor() , "title" : "PMS8012X"],
        ["color" : UIColor.pantonePMS802Color() , "title" : "PMS802"],
        ["color" : UIColor.pantonePMS8022XColor() , "title" : "PMS8022X"],
        ["color" : UIColor.pantonePMS803Color() , "title" : "PMS803"],
        ["color" : UIColor.pantonePMS8032XColor() , "title" : "PMS8032X"],
        ["color" : UIColor.pantonePMS804Color() , "title" : "PMS804"],
        ["color" : UIColor.pantonePMS8042XColor() , "title" : "PMS8042X"],
        ["color" : UIColor.pantonePMS805Color() , "title" : "PMS805"],
        ["color" : UIColor.pantonePMS8052XColor() , "title" : "PMS8052X"],
        ["color" : UIColor.pantonePMS806Color() , "title" : "PMS806"],
        ["color" : UIColor.pantonePMS8062XColor() , "title" : "PMS8062X"],
        ["color" : UIColor.pantonePMS807Color() , "title" : "PMS807"],
        ["color" : UIColor.pantonePMS8072XColor() , "title" : "PMS8072X"],
        ["color" : UIColor.pantonePMS808Color() , "title" : "PMS808"],
        ["color" : UIColor.pantonePMS8082XColor() , "title" : "PMS8082X"],
        ["color" : UIColor.pantonePMS809Color() , "title" : "PMS809"],
        ["color" : UIColor.pantonePMS8092XColor() , "title" : "PMS8092X"],
        ["color" : UIColor.pantonePMS810Color() , "title" : "PMS810"],
        ["color" : UIColor.pantonePMS8102XColor() , "title" : "PMS8102X"],
        ["color" : UIColor.pantonePMS811Color() , "title" : "PMS811"],
        ["color" : UIColor.pantonePMS8112XColor() , "title" : "PMS8112X"],
        ["color" : UIColor.pantonePMS812Color() , "title" : "PMS812"],
        ["color" : UIColor.pantonePMS8122XColor() , "title" : "PMS8122X"],
        ["color" : UIColor.pantonePMS813Color() , "title" : "PMS813"],
        ["color" : UIColor.pantonePMS8132XColor() , "title" : "PMS8132X"],
        ["color" : UIColor.pantonePMS814Color() , "title" : "PMS814"],
        ["color" : UIColor.pantonePMS8142XColor() , "title" : "PMS8142X"],
        ["color" : UIColor.pantonePantoneYellowColor() , "title" : "PantoneYellow"],
        ["color" : UIColor.pantoneProcessBlueColor() , "title" : "ProcessBlue"],
        ["color" : UIColor.pantoneProcessBlue2XColor() , "title" : "ProcessBlue2X"],
        ["color" : UIColor.pantoneProcessYellowColor() , "title" : "ProcessYellow"],
        ["color" : UIColor.pantonePurpleColor() , "title" : "Purple"],
        ["color" : UIColor.pantonePurple2XColor() , "title" : "Purple2X"],
        ["color" : UIColor.pantoneRed032Color() , "title" : "Red032"],
        ["color" : UIColor.pantoneReflexBlueColor() , "title" : "ReflexBlue"],
        ["color" : UIColor.pantoneReflexBlue2XColor() , "title" : "ReflexBlue2X"],
        ["color" : UIColor.pantoneRhodamineRedColor() , "title" : "RhodamineRed"],
        ["color" : UIColor.pantoneRhodamineRed2XColor() , "title" : "RhodamineRed2X"],
        ["color" : UIColor.pantoneRubineRedColor() , "title" : "RubineRed"],
        ["color" : UIColor.pantoneRubineRed2XColor() , "title" : "RubineRed2X"],
        ["color" : UIColor.pantoneVioletColor() , "title" : "Violet"],
        ["color" : UIColor.pantoneViolet2XColor() , "title" : "Violet2X"],
        ["color" : UIColor.pantoneWarmGray1Color() , "title" : "WarmGray1"],
        ["color" : UIColor.pantoneWarmGray10Color() , "title" : "WarmGray10"],
        ["color" : UIColor.pantoneWarmGray11Color() , "title" : "WarmGray11"],
        ["color" : UIColor.pantoneWarmGray2Color() , "title" : "WarmGray2"],
        ["color" : UIColor.pantoneWarmGray3Color() , "title" : "WarmGray3"],
        ["color" : UIColor.pantoneWarmGray4Color() , "title" : "WarmGray4"],
        ["color" : UIColor.pantoneWarmGray5Color() , "title" : "WarmGray5"],
        ["color" : UIColor.pantoneWarmGray6Color() , "title" : "WarmGray6"],
        ["color" : UIColor.pantoneWarmGray7Color() , "title" : "WarmGray7"],
        ["color" : UIColor.pantoneWarmGray8Color() , "title" : "WarmGray8"],
        ["color" : UIColor.pantoneWarmGray9Color() , "title" : "WarmGray9"],
        ["color" : UIColor.pantoneWarmRedColor() , "title" : "WarmRed"],
        ["color" : UIColor.pantoneWarmRed2XColor() , "title" : "WarmRed2X"],
        ["color" : UIColor.pantoneYellow2XColor() , "title" : "Yellow2X"]]

    static var flatColors:Array<Dictionary<String,AnyObject>> = [["color" : UIColor.flatBlackColor(), "title" : "Black"],
        ["color" : UIColor.flatBlueColor(), "title" : "Blue"],
        ["color" : UIColor.flatBrownColor(), "title" : "Brown"],
        ["color" : UIColor.flatCoffeeColor(), "title" : "Coffee"],
        ["color" : UIColor.flatForestGreenColor(), "title" : "ForestGreen"],
        ["color" : UIColor.flatGrayColor(), "title" : "Gray"],
        ["color" : UIColor.flatGreenColor(), "title" : "Green"],
        ["color" : UIColor.flatLimeColor(), "title" : "Lime"],
        ["color" : UIColor.flatMagentaColor(), "title" : "Magenta"],
        ["color" : UIColor.flatMaroonColor(), "title" : "Maroon"],
        ["color" : UIColor.flatMintColor(), "title" : "Mint"],
        ["color" : UIColor.flatNavyBlueColor(), "title" : "NavyBlue"],
        ["color" : UIColor.flatOrangeColor(), "title" : "Orange"],
        ["color" : UIColor.flatPinkColor(), "title" : "Pink"],
        ["color" : UIColor.flatPlumColor(), "title" : "Plum"],
        ["color" : UIColor.flatPowderBlueColor(), "title" : "PowderBlue"],
        ["color" : UIColor.flatPurpleColor(), "title" : "Purple"],
        ["color" : UIColor.flatRedColor(), "title" : "Red"],
        ["color" : UIColor.flatSandColor(), "title" : "Sand"],
        ["color" : UIColor.flatSkyBlueColor(), "title" : "SkyBlue"],
        ["color" : UIColor.flatTealColor(), "title" : "Teal"],
        ["color" : UIColor.flatWatermelonColor(), "title" : "Watermelon"],
        ["color" : UIColor.flatWhiteColor(), "title" : "White"],
        ["color" : UIColor.flatYellowColor(), "title" : "Yellow"],
        ["color" : UIColor.flatBlackColorDark(), "title" : "Dark Black"],
        ["color" : UIColor.flatBlueColorDark(), "title" : "Dark Blue"],
        ["color" : UIColor.flatBrownColorDark(), "title" : "Dark Brown"],
        ["color" : UIColor.flatCoffeeColorDark(), "title" : "Dark Coffee"],
        ["color" : UIColor.flatForestGreenColorDark(), "title" : "Dark ForestGreen"],
        ["color" : UIColor.flatGrayColorDark(), "title" : "Dark Gray"],
        ["color" : UIColor.flatGreenColorDark(), "title" : "Dark Green"],
        ["color" : UIColor.flatLimeColorDark(), "title" : "Dark Lime"],
        ["color" : UIColor.flatMagentaColorDark(), "title" : "Dark Magenta"],
        ["color" : UIColor.flatMaroonColorDark(), "title" : "Dark Maroon"],
        ["color" : UIColor.flatMintColorDark(), "title" : "Dark Mint"],
        ["color" : UIColor.flatNavyBlueColorDark(), "title" : "Dark NavyBlue"],
        ["color" : UIColor.flatOrangeColorDark(), "title" : "Dark Orange"],
        ["color" : UIColor.flatPinkColorDark(), "title" : "Dark Pink"],
        ["color" : UIColor.flatPlumColorDark(), "title" : "Dark Plum"],
        ["color" : UIColor.flatPowderBlueColorDark(), "title" : "Dark PowderBlue"],
        ["color" : UIColor.flatPurpleColorDark(), "title" : "Dark Purple"],
        ["color" : UIColor.flatRedColorDark(), "title" : "Dark Red"],
        ["color" : UIColor.flatSandColorDark(), "title" : "Dark Sand"],
        ["color" : UIColor.flatSkyBlueColorDark(), "title" : "Dark SkyBlue"],
        ["color" : UIColor.flatTealColorDark(), "title" : "Dark Teal"],
        ["color" : UIColor.flatWatermelonColorDark(), "title" : "Dark Watermelon"],
        ["color" : UIColor.flatWhiteColorDark(), "title" : "Dark White"],
        ["color" : UIColor.flatYellowColorDark(), "title" : "Dark Yellow"]]
}
