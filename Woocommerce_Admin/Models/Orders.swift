//
//  Orders.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 27/11/2019.
//  Copyright © 2019 Halliday. All rights reserved.
//
struct Orders: Decodable {
    let id: Int
    let currency: String
    let total: String
    let shipping_total: String
    let cart_tax: String
    let customer_id: Int
    let customer_note: String
    let billing: Billing
	let line_items: [LineItems]
	let status: String
}

struct Billing: Decodable {
    let first_name: String
    let last_name: String
    let company: String
    let address_1: String
    let address_2: String
    let city: String
    let state: String
    let postcode: String
    let country: String
    let email: String
    let phone: String
}

struct LineItems: Decodable {
	let id: Int
	let name: String
	let product_id: Int
	let variation_id: Int
	let quantity: Int
	let subtotal: String
	let subtotal_tax: String
	let sku: String
}

enum OrderDetails: Int {
	case FirstName = 0
    case Surname
	case Address1
}

enum OrderStatus: String {
	case PaymentPending = "pending"
	case Failed = "failed"
	case Processing = "processing"
	case Completed = "completed"
	case OnHold = "on-hold"
	case Cancelled = "cancelled"
	case Refunded = "refunded"
}
