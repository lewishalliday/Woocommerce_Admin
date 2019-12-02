//
//  AppDelegate.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 25/11/2019.
//  Copyright © 2019 Halliday. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		
		UITableView.appearance().backgroundColor = UIColor.init(named:"tableview")
		UITableViewCell.appearance().backgroundColor = UIColor.init(named:"tableview")
		
		if #available(iOS 13.0, *) {
			let appearance = UINavigationBarAppearance()
			appearance.backgroundColor = UIColor.init(named: "brandColor")
			appearance.largeTitleTextAttributes = [.font: UIFont(name: "AvenirNext-DemiBold", size:30 )!, .foregroundColor: UIColor.white]
			appearance.titleTextAttributes = [.font: UIFont(name: "AvenirNext-DemiBold", size:20 )!, .foregroundColor: UIColor.white]

			UINavigationBar.appearance().tintColor = .white
			UINavigationBar.appearance().standardAppearance = appearance
			UINavigationBar.appearance().compactAppearance = appearance
			UINavigationBar.appearance().scrollEdgeAppearance = appearance

		} else {
			UINavigationBar.appearance().tintColor = .white
			UINavigationBar.appearance().barTintColor = UIColor.init(named: "navBar")
			UINavigationBar.appearance().isTranslucent = false
		}
		
		UITabBar.appearance().tintColor = UIColor.init(named: "brandColor")
        UILabel.appearance().textColor = UIColor.init(named: "text")
		UILabel.appearance().font = UIFont(name: "Avenir Next", size: 16)
		
		return true
	}
	


	// MARK: UISceneSession Lifecycle

	/*func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}*/


}

