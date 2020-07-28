// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SMBOProduct.swift instead.

import Foundation
import CoreData

public enum SMBOProductAttributes: String {
    case bodyMetal = "bodyMetal"
    case carModel = "carModel"
    case carYear = "carYear"
    case engine = "engine"
    case identifier = "identifier"
    case madeIn = "madeIn"
    case marketSale = "marketSale"
    case monolith = "monolith"
    case price = "price"
    case ref = "ref"
    case ref2 = "ref2"
    case slug = "slug"
    case weight = "weight"
}

public enum SMBOProductRelationships: String {
    case brands = "brands"
    case images = "images"
}

open class _SMBOProduct: NSManagedObject {

    // MARK: - Class methods

    open class func entityName () -> String {
        return "SMBOProduct"
    }

    open class func entity(managedObjectContext: NSManagedObjectContext) -> NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: self.entityName(), in: managedObjectContext)
    }

    @nonobjc
    open class func fetchRequest() -> NSFetchRequest<SMBOProduct> {
        return NSFetchRequest(entityName: self.entityName())
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }

    public convenience init?(managedObjectContext: NSManagedObjectContext) {
        guard let entity = _SMBOProduct.entity(managedObjectContext: managedObjectContext) else { return nil }
        self.init(entity: entity, insertInto: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged open
    var bodyMetal: String?

    @NSManaged open
    var carModel: String?

    @NSManaged open
    var carYear: String?

    @NSManaged open
    var engine: String?

    @NSManaged open
    var identifier: Int64 // Optional scalars not supported

    @NSManaged open
    var madeIn: String?

    @NSManaged open
    var marketSale: String?

    @NSManaged open
    var monolith: String?

    @NSManaged open
    var price: Double // Optional scalars not supported

    @NSManaged open
    var ref: String?

    @NSManaged open
    var ref2: String?

    @NSManaged open
    var slug: String?

    @NSManaged open
    var weight: String?

    // MARK: - Relationships

    @NSManaged open
    var brands: NSSet

    open func brandsSet() -> NSMutableSet {
        return self.brands.mutableCopy() as! NSMutableSet
    }

    @NSManaged open
    var images: NSOrderedSet

    open func imagesSet() -> NSMutableOrderedSet {
        return self.images.mutableCopy() as! NSMutableOrderedSet
    }

}

extension _SMBOProduct {

    open func addBrands(_ objects: NSSet) {
        let mutable = self.brands.mutableCopy() as! NSMutableSet
        mutable.union(objects as Set<NSObject>)
        self.brands = mutable.copy() as! NSSet
    }

    open func removeBrands(_ objects: NSSet) {
        let mutable = self.brands.mutableCopy() as! NSMutableSet
        mutable.minus(objects as Set<NSObject>)
        self.brands = mutable.copy() as! NSSet
    }

    open func addBrandsObject(_ value: SMBOAutoBrand) {
        let mutable = self.brands.mutableCopy() as! NSMutableSet
        mutable.add(value)
        self.brands = mutable.copy() as! NSSet
    }

    open func removeBrandsObject(_ value: SMBOAutoBrand) {
        let mutable = self.brands.mutableCopy() as! NSMutableSet
        mutable.remove(value)
        self.brands = mutable.copy() as! NSSet
    }

}

extension _SMBOProduct {

    open func addImages(_ objects: NSOrderedSet) {
        let mutable = self.images.mutableCopy() as! NSMutableOrderedSet
        mutable.union(objects)
        self.images = mutable.copy() as! NSOrderedSet
    }

    open func removeImages(_ objects: NSOrderedSet) {
        let mutable = self.images.mutableCopy() as! NSMutableOrderedSet
        mutable.minus(objects)
        self.images = mutable.copy() as! NSOrderedSet
    }

    open func addImagesObject(_ value: SMBOProductImage) {
        let mutable = self.images.mutableCopy() as! NSMutableOrderedSet
        mutable.add(value)
        self.images = mutable.copy() as! NSOrderedSet
    }

    open func removeImagesObject(_ value: SMBOProductImage) {
        let mutable = self.images.mutableCopy() as! NSMutableOrderedSet
        mutable.remove(value)
        self.images = mutable.copy() as! NSOrderedSet
    }

}

