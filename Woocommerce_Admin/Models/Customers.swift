//
//  Customers.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 27/11/2019.
//  Copyright © 2019 Halliday. All rights reserved.
//

struct Customers: Decodable {
    let id: Int
    let first_name: String
    let last_name: String
    let username: String
    let billing: CustomerBilling?
}

struct CustomerBilling: Decodable {
    let first_name: String
    let last_name: String
    let company: String?
    let address_1: String
    let address_2: String?
    let city: String
    let state: String?
    let postcode: String
    let country: String
    let email: String
    let phone: String
}


