// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SMBOUser.swift instead.

import Foundation
import CoreData

public enum SMBOUserAttributes: String {
    case countryCode = "countryCode"
    case currencyCode = "currencyCode"
    case dateCreated = "dateCreated"
    case dateUpdated = "dateUpdated"
    case email = "email"
    case hasWhatsApp = "hasWhatsApp"
    case identifier = "identifier"
    case lastUserPackedID = "lastUserPackedID"
    case localeCode = "localeCode"
    case name = "name"
    case profileAddress = "profileAddress"
    case profileCity = "profileCity"
    case profilePhone = "profilePhone"
    case profileZip = "profileZip"
}

open class _SMBOUser: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "SMBOUser"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<SMBOUser> {
        return NSFetchRequest(entityName: self.entityName())
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _SMBOUser.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var countryCode: String?

    @NSManaged open
    var currencyCode: String?

    @NSManaged open
    var dateCreated: Date?

    @NSManaged open
    var dateUpdated: Date?

    @NSManaged open
    var email: String?

    @NSManaged open
    var hasWhatsApp: Bool

    @NSManaged open
    var identifier: Int64 // Optional scalars not supported

    @NSManaged open
    var lastUserPackedID: String?

    @NSManaged open
    var localeCode: String?

    @NSManaged open
    var name: String?

    @NSManaged open
    var profileAddress: String?

    @NSManaged open
    var profileCity: String?

    @NSManaged open
    var profilePhone: String?

    @NSManaged open
    var profileZip: String?

    // MARK: - Relationships

}

