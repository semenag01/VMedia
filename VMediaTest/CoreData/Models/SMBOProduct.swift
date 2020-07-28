import CoreData
import VRGSoftSwiftIOSKit

@objc(SMBOProduct)
open class SMBOProduct: _SMBOProduct, SMDBStorableObject {
	// Custom logic goes here.
    
    var brandsArray: [SMBOAutoBrand] {
        
        brands.compactMap { return $0 as? SMBOAutoBrand }
    }
    
    public func setupWithDictionary(_ aData: [String: Any], context aContext: NSManagedObjectContext) {
        
        bodyMetal = aData["slug"] as? String
        carModel = aData["car_model"] as? String
        carYear = aData["car_year"] as? String
        engine = aData["engine"] as? String
        madeIn = aData["madein"] as? String
        marketSale = aData["marketsale"] as? String
        monolith = aData["monolyth"] as? String
        ref = aData["ref"] as? String
        ref2 = aData["ref"] as? String
        slug = aData["ref2"] as? String
        weight = aData["weight"] as? String
        let priceString: String? = aData["price_data"] as? String
        price = Double(priceString ?? "") ?? 0
        
        if let brandsArray: [[String: Any]] = aData["brands"] as? [[String: Any]] {
            
            brandsArray.forEach { (brandData) in
                
                let autoBrand: SMBOAutoBrand? = SMBOAutoBrand.makeOrUpdateObjectWithData(brandData, inContext: aContext)
                
                autoBrand.map(addBrandsObject(_:))
            }
        }
        
        if let imagesArray: [[String: Any]] = aData["images"] as? [[String: Any]] {
            
            imagesArray.forEach { (imagesData) in
                
                let images: SMBOProductImage? = SMBOProductImage.makeOrUpdateObjectWithData(imagesData, inContext: aContext)
                
                images.map(addImagesObject(_:))
            }
        }
    }
}
