import CoreData
import VRGSoftSwiftIOSKit

@objc(SMBOCountry)
open class SMBOCountry: _SMBOCountry, SMDBStorableObject {

	public static var dafaultSortDescriptors: [NSSortDescriptor] {

		return [NSSortDescriptor(key: SMBOCountryAttributes.name.rawValue, ascending: true)]
	}

	public func setupWithDictionary(_ aData: [String: Any], context aContext: NSManagedObjectContext) {

		isoCode = aData["iso_code"] as? String
		nameInEnglish = aData["name_en"] as? String
		name = aData["name"] as? String
    }

    static func countryBy(isoCode: String) -> SMBOCountry? {

        let predicate: NSPredicate = NSPredicate(
			format: "\(SMBOCountryAttributes.isoCode) BEGINSWITH[c] %@", isoCode
		)

		return SMBOCountry.objectsWithPredicate(predicate).first
    }

	static func countriesReqBy(name: String) -> SMDBRequest {

        let predicate: NSPredicate = NSPredicate(
			format: "\(SMBOCountryAttributes.name) CONTAINS[c] %@", name
		)

		return SMBOCountry.objectsReqWithPredicate(predicate)
	}
}
