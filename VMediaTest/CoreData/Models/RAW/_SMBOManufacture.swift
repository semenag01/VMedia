// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SMBOManufacture.swift instead.

import Foundation
import CoreData

public enum SMBOManufactureAttributes: String {
    case identifier = "identifier"
    case logoUrl = "logoUrl"
    case name = "name"
    case slug = "slug"
}

open class _SMBOManufacture: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "SMBOManufacture"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<SMBOManufacture> {
        return NSFetchRequest(entityName: self.entityName())
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _SMBOManufacture.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var identifier: Int64 // Optional scalars not supported

    @NSManaged open
    var logoUrl: String?

    @NSManaged open
    var name: String?

    @NSManaged open
    var slug: String?

    // MARK: - Relationships

}

