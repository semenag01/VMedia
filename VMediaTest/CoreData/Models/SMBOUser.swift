import CoreData
import VRGSoftSwiftIOSKit

@objc(SMBOUser)
open class SMBOUser: _SMBOUser, SMDBStorableObject {

	public func setupWithDictionary(_ aData: [String: Any], context aContext: NSManagedObjectContext) {

		name = aData["name"] as? String
		email = aData["email"] as? String
        countryCode = aData["country_code"] as? String
        currencyCode = aData["currency_code"] as? String
        hasWhatsApp = (aData["profile_has_whatsapp"] as? String).map(Int.init) == 1
        lastUserPackedID = aData["last_user_packet_id"] as? String
        localeCode = aData["locale"] as? String
        profileAddress = aData["profile_address"] as? String
        profileCity = aData["profile_city"] as? String
        profilePhone = aData["profile_phone"] as? String
        profileZip = aData["profile_zip"] as? String

        if let string: String = aData["updated_at"] as? String {

			dateUpdated = DateFormatter.iso8601.date(from: string)
		}

        if let string: String = aData["created_at"] as? String {

			dateCreated = DateFormatter.iso8601.date(from: string)
		}
    }

    var params: [String: AnyObject] {

        var result: [String: AnyObject] = [:]

        if let name: String = name {

            result["name"] = name as AnyObject
        }

        if let email: String = email {

            result["email"] = email as AnyObject
        }

        if let countryCode: String = countryCode {

            result["country_code"] = countryCode as AnyObject
        }

        if let currencyCode: String = currencyCode {

            result["currency_code"] = currencyCode as AnyObject
        }

        if let lastUserPackedID: String = lastUserPackedID {

            result["last_user_packet_id"] = lastUserPackedID as AnyObject
        }

        if let localeCode: String = localeCode {

            result["locale"] = localeCode as AnyObject
        }

        if let profileAddress: String = profileAddress {

            result["profile_address"] = profileAddress as AnyObject
        }

        if let profileCity: String = profileCity {

            result["profile_city"] = profileCity as AnyObject
        }

        if let profilePhone: String = profilePhone {

            result["profile_phone"] = profilePhone as AnyObject
        }

        if let profileZip: String = profileZip {

            result["profile_zip"] = profileZip as AnyObject
        }

        result["profile_has_whatsapp"] = hasWhatsApp as AnyObject

        return result
    }

    func updateWithSettingsModel(_ model: SMAppSettings) {

        localeCode = model.locale
        countryCode = model.country
        currencyCode = model.currency
    }

    func country() -> SMBOCountry? {

        guard let countryCode: String = countryCode else { return nil }

        return SMBOCountry.countryBy(isoCode: countryCode)
    }
}
