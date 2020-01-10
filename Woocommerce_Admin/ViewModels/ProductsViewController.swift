//
//  ProductsViewController.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 07/01/2020.
//  Copyright © 2020 IT-Developers. All rights reserved.
//

import UIKit
import CollectionViewShelfLayout

class ProductsViewController: UIViewController {

    var product = [Prouducts]()
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let ProductCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        ProductCollectionView.translatesAutoresizingMaskIntoConstraints = false
        ProductCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return ProductCollectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        
        LoadProducts()
        
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
    
    // MARK: - Load product data
    private func LoadProducts(){
        self.showSpinner()
        self.product.removeAll()
        GetProducts() { (result) in
            switch result {
            case .success(let orders):
                for items in orders{
                    self.product.append(items)
                }
                DispatchQueue.main.async {
                    self.removeSpinner(indicator: .none)
                    self.collectionView.reloadData()
                }
                case .failure(let err):
                    DispatchQueue.main.async {
                        self.removeSpinner(indicator: .failed, completionLabel: "Failed loading data", completionTimeout: 1.0)
                        self.alert(message: "Failed to get products", title: "Error", confirmBtn: "OK", style: .alert)
                        print(err)
                    }
            }
        }
    }
}



extension ProductsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        cell.data = product[indexPath.row]
        return cell
    }

}

