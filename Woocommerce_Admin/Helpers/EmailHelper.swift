//
//  EmailHelper.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 10/01/2020.
//  Copyright © 2020 IT-Developers. All rights reserved.
//

import MessageUI
import UIKit

extension UIViewController{
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
    
}
