//
//  ProductsViewController.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 07/01/2020.
//  Copyright © 2020 IT-Developers. All rights reserved.
//

import UIKit

struct CustomData{
    var title: String
    var image: UIImage
    var url: String
}


class ProductsViewController: UIViewController {
    
    let data = [
        CustomData(title: "Image 1", image: #imageLiteral(resourceName: "image1"), url: "string"),
        CustomData(title: "Image 2", image: #imageLiteral(resourceName: "image2"), url: "string"),
        CustomData(title: "Image 3", image: #imageLiteral(resourceName: "image3"), url: "string")
    ]
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        if #available(iOS 11.0, *) {
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        } else {
            collectionView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 30).isActive = true
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        }
        collectionView.backgroundColor = .white
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}

extension ProductsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        cell.data = self.data[indexPath.row]
        return cell
    }
    
    
}
