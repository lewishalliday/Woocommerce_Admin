//
//  AppDelegate.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 25/11/2019.
//  Copyright © 2019 Halliday. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		//Temp Keys
		KeychainWrapper.standard.set("Halliday", forKey: "storeName")
		KeychainWrapper.standard.set("https://api.halliday.xyz/wp-json/wc/v3/", forKey: "apiUrl")
		KeychainWrapper.standard.set("ck_021d9f5309e1d8ebc952582c38545997a40e1bf8", forKey: "apiKey")
		KeychainWrapper.standard.set("cs_0105a3abe33f2dfae179908351196db816b7fa08", forKey: "apiPassword")
		
		UITableView.appearance().backgroundColor = UIColor.customColor(.tableview)
		UITableViewCell.appearance().backgroundColor = UIColor.customColor(.tableview)
		
		if #available(iOS 13.0, *) {
			let appearance = UINavigationBarAppearance()
			appearance.backgroundColor = UIColor.customColor(.brandColor)
			appearance.largeTitleTextAttributes = [.font: UIFont(name: "AvenirNext-DemiBold", size:30 )!, .foregroundColor: UIColor.white]
			appearance.titleTextAttributes = [.font: UIFont(name: "AvenirNext-DemiBold", size:20 )!, .foregroundColor: UIColor.white]

			UINavigationBar.appearance().tintColor = .white
			UINavigationBar.appearance().standardAppearance = appearance
			UINavigationBar.appearance().compactAppearance = appearance
			UINavigationBar.appearance().scrollEdgeAppearance = appearance

		} else {
			UINavigationBar.appearance().tintColor = .white
			UINavigationBar.appearance().barTintColor = UIColor.customColor(.brandColor)
			UINavigationBar.appearance().isTranslucent = false
		}
		
		UITabBar.appearance().tintColor = UIColor.customColor(.brandColor)
		UILabel.appearance().textColor = UIColor.customColor(.text)
		UILabel.appearance().font = UIFont(name: "Avenir Next", size: 16)
        UIRefreshControl.appearance().tintColor = .white
		
		return true
	}

}

