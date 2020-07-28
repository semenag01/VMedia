import CoreData
import VRGSoftSwiftIOSKit

@objc(SMBOLocale)
open class SMBOLocale: _SMBOLocale, SMDBStorableObject {

	public static var primaryKey: String {

		return SMBOLocaleAttributes.isoCode.rawValue
	}

    static func localeBy(isoCode: String) -> SMBOLocale? {

        let predicate: NSPredicate = NSPredicate(format: "\(SMBOLocaleAttributes.isoCode.rawValue) BEGINSWITH[c] %@", isoCode)

		return SMBOLocale.objectsWithPredicate(predicate).first
    }

    public func setupWithDictionary(_ aData: [String: Any], context aContext: NSManagedObjectContext) {

        name = aData["name"] as? String
    }
}
