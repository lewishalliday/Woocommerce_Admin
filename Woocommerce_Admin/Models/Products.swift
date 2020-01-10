//
//  Products.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 03/12/2019.
//  Copyright © 2019 Halliday. All rights reserved.
//

struct Prouducts: Decodable {
	let id: Int
	let name: String?
	let permalink: String?
	let type, status: String?
	let featured: Bool?
	let description: String?
	let sku, price, regularPrice: String?
	let salePrice: String?
	let priceHTML: String?
	let onSale, purchasable: Bool?
	let totalSales: Int?
	let externalURL, buttonText, taxStatus, taxClass: String?
	let manageStock: Bool?
	let stockStatus, backorders: String?
	let backordersAllowed, backordered, soldIndividually: Bool?
	let weight: String?
	let dimensions: Dimensions?
	let shippingRequired, shippingTaxable: Bool?
	let shippingClass: String?
	let shippingClassID: Int?
	let reviewsAllowed: Bool?
	let averageRating: String?
	let ratingCount: Int?
	let images: [Image]
}

// MARK: - Dimensions
struct Dimensions: Decodable {
	let length, width, height: String
}

struct Image: Decodable {
	let id: Int
	let src: String
	let name: String
	let alt: String
}
