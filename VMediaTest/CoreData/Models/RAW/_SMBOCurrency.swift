// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SMBOCurrency.swift instead.

import Foundation
import CoreData

public enum SMBOCurrencyAttributes: String {
    case countryCode = "countryCode"
    case hidden = "hidden"
    case identifier = "identifier"
    case isoCode = "isoCode"
    case main = "main"
    case name = "name"
    case rate = "rate"
    case sign = "sign"
}

open class _SMBOCurrency: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "SMBOCurrency"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<SMBOCurrency> {
        return NSFetchRequest(entityName: self.entityName())
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _SMBOCurrency.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var countryCode: String!

    @NSManaged open
    var hidden: Bool

    @NSManaged open
    var identifier: String?

    @NSManaged open
    var isoCode: String!

    @NSManaged open
    var main: Bool

    @NSManaged open
    var name: String!

    @NSManaged open
    var rate: Double

    @NSManaged open
    var sign: String?

    // MARK: - Relationships

}

