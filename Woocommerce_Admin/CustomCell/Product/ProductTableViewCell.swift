//
//  ProductTableViewCell.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 02/12/2019.
//  Copyright © 2019 Halliday. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
	@IBOutlet weak var productCost: UILabel!
	@IBOutlet weak var productName: UILabel!
}
