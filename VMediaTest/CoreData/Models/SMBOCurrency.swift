import CoreData
import VRGSoftSwiftIOSKit

@objc(SMBOCurrency)
open class SMBOCurrency: _SMBOCurrency, SMDBStorableObject {

	public var primaryKey: String {
		SMBOCurrencyAttributes.isoCode.rawValue
	}

	public func setupWithDictionary(_ aData: [String: Any], context aContext: NSManagedObjectContext) {

		name = aData["name"] as? String
		isoCode = aData["code"] as? String
		sign = aData["sign"] as? String
		name = aData["name"] as? String
		rate = (aData["rate"] as? Double) ?? 0
		main = (aData["main"] as? Bool) ?? false
		hidden = (aData["hidden"] as? Bool) ?? false
		countryCode = aData["country_code"] as? String
    }

    private static func predicateBy(code: String) -> NSPredicate {

		return NSPredicate(format: "\(SMBOCurrencyAttributes.isoCode) BEGINSWITH[c] %@", code)
    }

    static func currencyBy(code: String) -> SMBOCurrency? {

		return SMBOCurrency.objectsWithPredicate(predicateBy(code: code)).first
    }

	var shortCurrencyString: String {

        if let sign: String = sign, !sign.isEmpty {

			return isoCode + " \(sign)"
		}
		return isoCode
	}

	var fullCurrencyString: String {

		if let sign: String = sign, let name: String = name, !sign.isEmpty {

			return isoCode + " \(sign)" + " (\(name)"
		}
		return isoCode + " (\(name ?? "")"
	}
}
