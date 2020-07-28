// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SMBOAutoBrandTranslation.swift instead.

import Foundation
import CoreData

public enum SMBOAutoBrandTranslationAttributes: String {
    case carBrandID = "carBrandID"
    case identifier = "identifier"
    case locale = "locale"
    case name = "name"
}

public enum SMBOAutoBrandTranslationRelationships: String {
    case autoBrand = "autoBrand"
}

open class _SMBOAutoBrandTranslation: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "SMBOAutoBrandTranslation"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<SMBOAutoBrandTranslation> {
        return NSFetchRequest(entityName: self.entityName())
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _SMBOAutoBrandTranslation.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var carBrandID: Int64

    @NSManaged open
    var identifier: Int64

    @NSManaged open
    var locale: String?

    @NSManaged open
    var name: String?

    // MARK: - Relationships

    @NSManaged open
    var autoBrand: SMBOAutoBrand?

}

