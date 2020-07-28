// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SMBOAutoBrand.swift instead.

import Foundation
import CoreData

public enum SMBOAutoBrandAttributes: String {
    case identifier = "identifier"
    case logoUrl = "logoUrl"
    case name = "name"
    case slug = "slug"
    case translatedName = "translatedName"
}

public enum SMBOAutoBrandRelationships: String {
    case products = "products"
    case translations = "translations"
}

open class _SMBOAutoBrand: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "SMBOAutoBrand"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<SMBOAutoBrand> {
        return NSFetchRequest(entityName: self.entityName())
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _SMBOAutoBrand.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var identifier: Int64

    @NSManaged open
    var logoUrl: URL?

    @NSManaged open
    var name: String?

    @NSManaged open
    var slug: String?

    @NSManaged open
    var translatedName: String?

    // MARK: - Relationships

    @NSManaged open
    var products: NSSet

    open func productsSet() -> NSMutableSet {
        return self.products.mutableCopy() as! NSMutableSet
    }

    @NSManaged open
    var translations: NSSet

    open func translationsSet() -> NSMutableSet {
        return self.translations.mutableCopy() as! NSMutableSet
    }

}

extension _SMBOAutoBrand {

    open func addProducts(_ objects: NSSet) {
        let mutable = self.products.mutableCopy() as! NSMutableSet
        mutable.union(objects as Set<NSObject>)
        self.products = mutable.copy() as! NSSet
    }

    open func removeProducts(_ objects: NSSet) {
        let mutable = self.products.mutableCopy() as! NSMutableSet
        mutable.minus(objects as Set<NSObject>)
        self.products = mutable.copy() as! NSSet
    }

    open func addProductsObject(_ value: SMBOProduct) {
        let mutable = self.products.mutableCopy() as! NSMutableSet
        mutable.add(value)
        self.products = mutable.copy() as! NSSet
    }

    open func removeProductsObject(_ value: SMBOProduct) {
        let mutable = self.products.mutableCopy() as! NSMutableSet
        mutable.remove(value)
        self.products = mutable.copy() as! NSSet
    }

}

extension _SMBOAutoBrand {

    open func addTranslations(_ objects: NSSet) {
        let mutable = self.translations.mutableCopy() as! NSMutableSet
        mutable.union(objects as Set<NSObject>)
        self.translations = mutable.copy() as! NSSet
    }

    open func removeTranslations(_ objects: NSSet) {
        let mutable = self.translations.mutableCopy() as! NSMutableSet
        mutable.minus(objects as Set<NSObject>)
        self.translations = mutable.copy() as! NSSet
    }

    open func addTranslationsObject(_ value: SMBOAutoBrandTranslation) {
        let mutable = self.translations.mutableCopy() as! NSMutableSet
        mutable.add(value)
        self.translations = mutable.copy() as! NSSet
    }

    open func removeTranslationsObject(_ value: SMBOAutoBrandTranslation) {
        let mutable = self.translations.mutableCopy() as! NSMutableSet
        mutable.remove(value)
        self.translations = mutable.copy() as! NSSet
    }

}

