//
//  Generic.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 28/11/2019.
//  Copyright © 2019 Halliday. All rights reserved.
//

import UIKit
import MessageUI
import SideMenu

extension UIViewController {
	func alert(message: String, title: String = "", confirmBtn: String = "OK", style: UIAlertController.Style = .alert) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
		let OKAction = UIAlertAction(title: confirmBtn , style: .default, handler: nil)
		alertController.addAction(OKAction)
		self.present(alertController, animated: true, completion: nil)
	}
	
	func makeCall(number: String) {
		if let phoneURL = NSURL(string: ("tel://" + number)) {
			
			let alert = UIAlertController(title: ("Call " + number + "?"), message: nil, preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
				UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
			}))
			
			alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
			self.present(alert, animated: true, completion: nil)
		}
	}
	
	func sendEmail(email: String, sender: MFMailComposeViewControllerDelegate) {
		if MFMailComposeViewController.canSendMail() {
			let mail = MFMailComposeViewController()
			mail.mailComposeDelegate = sender
			mail.setToRecipients([email])
            mail.setSubject("Your \(Constants.CompanyName) Order")
			//mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
			
			self.present(mail, animated: true)
		} else {
			print("Email not available")
			alert(message: "Email services are not currently available")
		}
	}
	
	@objc(mailComposeController:didFinishWithResult:error:) func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
		controller.dismiss(animated: true)
	}
	
	@objc func ShowMenu()
	{
		let menu = storyboard!.instantiateViewController(withIdentifier: "Menu") as! SideMenuNavigationController
		menu.presentationStyle = .menuSlideIn
		menu.presentationStyle.onTopShadowOpacity = 0.3
		menu.presentationStyle.onTopShadowColor = .white
		menu.blurEffectStyle = .none
		menu.animationOptions = .curveEaseInOut
		menu.pushStyle = .replace
		present(menu, animated: true, completion: nil)
	}
}
