//
//  ProductCollectionViewCell.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 07/01/2020.
//  Copyright © 2020 IT-Developers. All rights reserved.
//

import Foundation
import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    
    var data: ProductData? {
        didSet {
            guard let data = data else { return }
            backgroundImage.image = data.image
            
        }
    }
    
    fileprivate let backgroundImage: UIImageView = {
       let productImage = UIImageView()
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.contentMode = .scaleAspectFill
        productImage.layer.cornerRadius = 12
        productImage.clipsToBounds = true
        return productImage
    }()
    
    fileprivate let title: UILabel = {
        let ProductTitle = UILabel()
        ProductTitle.text = "Test"
        ProductTitle.textColor = .blue
        ProductTitle.font = UIFont(name: "Arial", size: 20)
        return ProductTitle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(backgroundImage)
        backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
