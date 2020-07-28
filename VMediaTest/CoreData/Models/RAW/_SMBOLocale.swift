// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SMBOLocale.swift instead.

import Foundation
import CoreData

public enum SMBOLocaleAttributes: String {
    case isoCode = "isoCode"
    case name = "name"
}

open class _SMBOLocale: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "SMBOLocale"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<SMBOLocale> {
        return NSFetchRequest(entityName: self.entityName())
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _SMBOLocale.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var isoCode: String!

    @NSManaged open
    var name: String!

    // MARK: - Relationships

}

