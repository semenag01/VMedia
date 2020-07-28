import CoreData
import VRGSoftSwiftIOSKit

@objc(SMBOProductImage)
open class SMBOProductImage: _SMBOProductImage, SMDBStorableObject {
    
    public static var primaryKey: String {
        
        return SMBOProductImageAttributes.imageFull.rawValue
    }

    public func setupWithDictionary(_ aData: [String: Any], context aContext: NSManagedObjectContext) {
        
        imageExtraLarge = (aData["full"] as? String).map(URL.init(string:)) ?? nil
        imageFull = (aData["xl"] as? String).map(URL.init(string:)) ?? nil
        imageLarge = (aData["lg"] as? String).map(URL.init(string:)) ?? nil
        imageMedium = (aData["md"] as? String).map(URL.init(string:)) ?? nil
        imageSmall = (aData["sm"] as? String).map(URL.init(string:)) ?? nil
    }
}
