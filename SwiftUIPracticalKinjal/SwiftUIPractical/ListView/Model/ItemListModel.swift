//
//  ItemListModel.swift
//  KinjalPracticalSwiftUI
//
//  Created by Kinjal panchal on 10/02/23.
//

import Foundation

// MARK: - RootProduct
class RootProduct: Codable {
    var products: [Product]?
    
    init(products: [Product]?) {
        self.products = products
    }
    
    static func getObjproducts() -> RootProduct {
        return RootProduct(products: [Product(citrusID: "display_1_F_Al-mgtjXrg-pn33UYREA0P0KCgoIRE1fMjMxMjQSABoMCP2us5YGEJrokdEDIgIIAQ==", title: "Diamond Label Shiraz", id: "23124", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", price: [Price(message:.perBottle, value: 0.0, isOfferPrice: false)], brand: "Rosemount", badges: ["https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png"], ratingCount: 4.0, messages:Messages(secondaryMessage: "Sponsored", sash: Sash(), promotionalMessage: ""), isAddToCartEnable: true, addToCartButtonText: .addToCart, isInTrolley: false, isInWishlist: false, purchaseTypes: .none, isFindMeEnable: false, saleUnitPrice: 1.0, totalReviewCount: 0, isDeliveryOnly: false, isDirectFromSupplier: false, isFavrite: false)])
    }
}

// MARK: - Product
class Product: Codable {
    var citrusID, title, id: String?
    var imageURL: String?
    var price: [Price]?
    var brand: String?
    var badges: [String]?
    var ratingCount: Double?
    var messages: Messages?
    var isAddToCartEnable: Bool?
    var addToCartButtonText: AddToCartButtonText?
    var isInTrolley, isInWishlist: Bool?
    var purchaseTypes: [PurchaseTypeElement]?
    var isFindMeEnable: Bool?
    var saleUnitPrice: Double?
    var totalReviewCount: Int?
    var isDeliveryOnly, isDirectFromSupplier: Bool?
    var isFavorite: Bool? = false
    
    enum CodingKeys: String, CodingKey {
        case citrusID
        case title, id, imageURL, price, brand, badges, ratingCount, messages, isAddToCartEnable, addToCartButtonText, isInTrolley, isInWishlist, purchaseTypes, isFindMeEnable, saleUnitPrice, totalReviewCount, isDeliveryOnly, isDirectFromSupplier
    }
    
    init(citrusID: String?, title: String?, id: String?, imageURL: String?, price: [Price]?, brand: String?, badges: [String]?, ratingCount: Double?, messages: Messages?, isAddToCartEnable: Bool?, addToCartButtonText: AddToCartButtonText?, isInTrolley: Bool?, isInWishlist: Bool?, purchaseTypes: [PurchaseTypeElement]?, isFindMeEnable: Bool?, saleUnitPrice: Double?, totalReviewCount: Int?, isDeliveryOnly: Bool?, isDirectFromSupplier: Bool?,isFavrite:Bool?) {
        self.citrusID = citrusID
        self.title = title
        self.id = id
        self.imageURL = imageURL
        self.price = price
        self.brand = brand
        self.badges = badges
        self.ratingCount = ratingCount
        self.messages = messages
        self.isAddToCartEnable = isAddToCartEnable
        self.addToCartButtonText = addToCartButtonText
        self.isInTrolley = isInTrolley
        self.isInWishlist = isInWishlist
        self.purchaseTypes = purchaseTypes
        self.isFindMeEnable = isFindMeEnable
        self.saleUnitPrice = saleUnitPrice
        self.totalReviewCount = totalReviewCount
        self.isDeliveryOnly = isDeliveryOnly
        self.isDirectFromSupplier = isDirectFromSupplier
        self.isFavorite = isFavrite
    }
    
    static func getProduct() -> Product  {
        
        return Product(citrusID: "display_1_F_Al-mgtjXrg-pn33UYREA0P0KCgoIRE1fMjMxMjQSABoMCP2us5YGEJrokdEDIgIIAQ==", title: "Diamond Label Shiraz", id: "23124", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", price: [Price(message:.perBottle, value: 0.0, isOfferPrice: false)], brand: "Rosemount", badges: ["https://media.danmurphys.com.au/dmo/content/Badges/award-winner-star.png"], ratingCount: 4.0, messages:Messages(secondaryMessage: "Sponsored", sash: Sash(), promotionalMessage: ""), isAddToCartEnable: true, addToCartButtonText: .addToCart, isInTrolley: false, isInWishlist: false, purchaseTypes: .none, isFindMeEnable: false, saleUnitPrice: 1.0, totalReviewCount: 0, isDeliveryOnly: false, isDirectFromSupplier: false, isFavrite: false)
    }
}

enum AddToCartButtonText: String, Codable {
    case addToCart = "Add to cart"
    case editQuantity = "Edit quantity"
}

// MARK: - Messages
class Messages: Codable {
    var secondaryMessage: String?
    var sash: Sash?
    var promotionalMessage: String?
    
    init(secondaryMessage: String?, sash: Sash?, promotionalMessage: String?) {
        self.secondaryMessage = secondaryMessage
        self.sash = sash
        self.promotionalMessage = promotionalMessage
    }
}

// MARK: - Sash
class Sash: Codable {
    var msg:String?
    
    init(msg: String? = nil) {
        self.msg = msg
    }
}

// MARK: - Price
class Price: Codable {
    var message: Message?
    var value: Double?
    var isOfferPrice: Bool?
    
    init(message: Message?, value: Double?, isOfferPrice: Bool?) {
        self.message = message
        self.value = value
        self.isOfferPrice = isOfferPrice
    }
}

enum Message: String, Codable {
    case inAnySix = "in any six"
    case perBottle = "per bottle"
}

// MARK: - PurchaseTypeElement
class PurchaseTypeElement: Codable {
    var purchaseType: PurchaseTypeEnum?
    var displayName: DisplayName?
    var unitPrice: Double?
    var minQtyLimit, maxQtyLimit, cartQty: Int?
    
    init(purchaseType: PurchaseTypeEnum?, displayName: DisplayName?, unitPrice: Double?, minQtyLimit: Int?, maxQtyLimit: Int?, cartQty: Int?) {
        self.purchaseType = purchaseType
        self.displayName = displayName
        self.unitPrice = unitPrice
        self.minQtyLimit = minQtyLimit
        self.maxQtyLimit = maxQtyLimit
        self.cartQty = cartQty
    }
}

enum DisplayName: String, Codable {
    case case6 = "case (6)"
    case each = "each"
    case perBottle = "per bottle"
    case perCaseOf6 = "per case of 6"
}

enum PurchaseTypeEnum: String, Codable {
    case bottle = "Bottle"
    case purchaseTypeCase = "Case"
}
