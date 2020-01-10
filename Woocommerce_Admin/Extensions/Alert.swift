//
//  Alert.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 28/11/2019.
//  Copyright © 2019 Halliday. All rights reserved.
//

import UIKit
import MessageUI

extension UIViewController {
	func alert(message: String, title: String = "", confirmBtn: String = "OK", style: UIAlertController.Style = .alert) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
		let OKAction = UIAlertAction(title: confirmBtn , style: .default, handler: nil)
		alertController.addAction(OKAction)
		self.present(alertController, animated: true, completion: nil)
	}
}
