//
//  Spinner.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 27/11/2019.
//  Copyright © 2019 IT-Developers. All rights reserved.
//

import RappleProgressHUD

extension UIViewController {
	func showSpinner(message: String = "") {
		let attributes = RappleActivityIndicatorView.attribute(style: .circle, tintColor: .white, screenBG: .black, progressBG: .black, progressBarBG: .black, progreeBarFill: .white, thickness: 3)
		RappleActivityIndicatorView.startAnimatingWithLabel(message, attributes: attributes)
	}
	
	func removeSpinner(indicator: RappleCompletion = .none, completionLabel: String = "", completionTimeout: Double = 0.0 ) {
		RappleActivityIndicatorView.stopAnimation(completionIndicator: indicator, completionLabel: completionLabel, completionTimeout: completionTimeout)
	}
}
