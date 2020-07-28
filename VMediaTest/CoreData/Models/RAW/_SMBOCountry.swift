// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SMBOCountry.swift instead.

import Foundation
import CoreData

public enum SMBOCountryAttributes: String {
    case identifier = "identifier"
    case isoCode = "isoCode"
    case name = "name"
    case nameInEnglish = "nameInEnglish"
}

open class _SMBOCountry: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "SMBOCountry"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<SMBOCountry> {
        return NSFetchRequest(entityName: self.entityName())
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _SMBOCountry.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var identifier: Int64

    @NSManaged open
    var isoCode: String!

    @NSManaged open
    var name: String!

    @NSManaged open
    var nameInEnglish: String!

    // MARK: - Relationships

}

