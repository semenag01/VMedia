import CoreData
import VRGSoftSwiftIOSKit

@objc(SMBOAutoBrand)
open class SMBOAutoBrand: _SMBOAutoBrand, SMDBStorableObject {

	public func setupWithDictionary(_ aData: [String: Any], context aContext: NSManagedObjectContext) {

		name = aData["name"] as? String
        logoUrl = (aData["logo"] as? String).map(URL.init(string:)) ?? nil
        slug = aData["slug"] as? String
        translatedName = aData["translit_name"] as? String
        
        guard let translationsData = aData["translations"] as? [[String: Any]] else { return }
            
        translationsData.forEach { (translationData) in
            
            let translation: SMBOAutoBrandTranslation? = SMBOAutoBrandTranslation
                .makeOrUpdateObjectWithData(translationData, inContext: aContext)
            
            translation.map(addTranslationsObject(_:))
        }
    }
}
