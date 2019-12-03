//
//  Color.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 03/12/2019.
//  Copyright © 2019 Halliday. All rights reserved.
//

import UIKit

enum AssetsColor {
	case brandColor
	case launchColor
	case orderNumber
	case tableview
	case text

}

extension UIColor {
	
	static func customColor(_ name: AssetsColor) -> UIColor? {
		switch name {
			case .brandColor:
				return UIColor(named: "brandColor")
			case .launchColor:
				return UIColor(named: "launchColor")
			case .orderNumber:
				return UIColor(named: "orderNumber")
			case .tableview:
				return UIColor(named: "tableview")
			case .text:
				return UIColor(named: "text")
		}
	}
}
