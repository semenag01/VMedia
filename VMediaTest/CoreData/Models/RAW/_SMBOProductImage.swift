// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SMBOProductImage.swift instead.

import Foundation
import CoreData

public enum SMBOProductImageAttributes: String {
    case imageExtraLarge = "imageExtraLarge"
    case imageFull = "imageFull"
    case imageLarge = "imageLarge"
    case imageMedium = "imageMedium"
    case imageSmall = "imageSmall"
}

public enum SMBOProductImageRelationships: String {
    case product = "product"
}

open class _SMBOProductImage: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "SMBOProductImage"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<SMBOProductImage> {
        return NSFetchRequest(entityName: self.entityName())
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _SMBOProductImage.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var imageExtraLarge: URL?

    @NSManaged open
    var imageFull: URL?

    @NSManaged open
    var imageLarge: URL?

    @NSManaged open
    var imageMedium: URL?

    @NSManaged open
    var imageSmall: URL?

    // MARK: - Relationships

    @NSManaged open
    var product: SMBOProduct?

}

