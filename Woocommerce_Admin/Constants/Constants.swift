//
//  Constants.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 26/11/2019.
//  Copyright © 2019 Halliday. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

struct Constants {
	static let CompanyName = KeychainWrapper.standard.string(forKey: "storeName")!
	static let APIUrl = KeychainWrapper.standard.string(forKey: "apiUrl")!
	static let APIKey = KeychainWrapper.standard.string(forKey: "apiKey")!
	static let APIPassword = KeychainWrapper.standard.string(forKey: "apiPassword")!
}
