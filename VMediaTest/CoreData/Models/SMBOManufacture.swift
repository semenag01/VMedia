import CoreData
import VRGSoftSwiftIOSKit

@objc(SMBOManufacture)
open class SMBOManufacture: _SMBOManufacture, SMDBStorableObject {

    public func setupWithDictionary(_ aData: [String: Any], context aContext: NSManagedObjectContext) {

        name = aData["name"] as? String
        logoUrl = aData["logo"] as? String
        slug = aData["slug"] as? String
    }
}
