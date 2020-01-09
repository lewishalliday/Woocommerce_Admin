//
//  ProductsCollectionViewCell.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 09/01/2020.
//  Copyright © 2020 IT-Developers. All rights reserved.
//

import UIKit
import Foundation

class ProductsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: ProductListingModel) {
        productImageView.image = model.image
        productName.text = model.name
    }

}
