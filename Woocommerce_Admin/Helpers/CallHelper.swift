//
//  CallHelper.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 10/01/2020.
//  Copyright © 2020 IT-Developers. All rights reserved.
//

import UIKit

extension UIViewController {
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
}
