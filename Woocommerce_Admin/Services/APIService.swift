//
//  APIService.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 26/11/2019.
//  Copyright © 2019 Halliday. All rights reserved.
//

import Foundation

let loginString = String(format: "%@:%@", Constants.APIKey, Constants.APIPassword)
let loginData = loginString.data(using: String.Encoding.utf8)!
let base64LoginString = loginData.base64EncodedString()

// MARK: - GET Order data with optional order number or customer ID
func GetOrders(orderNum: String?, customerId: Int, completion: @escaping (Result<[Orders], Error>) -> ()) {
    
    var urlString = "\(Constants.APIUrl)orders"
    if orderNum != nil{ urlString.append(contentsOf: String("/\(orderNum)"))}
    else if customerId >= 0 { urlString.append(contentsOf: String("?customer=" + String(customerId)))}
    
    var request = URLRequest(url: URL(string: urlString)!)
    request.httpMethod = "GET"
    request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        
        if let error = error {
            completion(.failure(error))
            return
        }
        
        do {
            let orders = try JSONDecoder().decode([Orders].self, from: data!)
            completion(.success(orders))
        } catch let jsonError {
            completion(.failure(jsonError))
        }
        
    }.resume()
}
// MARK: - GET Customers
func GetCustomers(customerId: String?, completion: @escaping (Result<[Customers], Error>) -> ()) {
    var request = URLRequest(url: URL(string: Constants.APIUrl + "customers/" + (customerId != nil ? customerId ?? "" : ""))!)
    request.httpMethod = "GET"
    request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        
        if let error = error {
            completion(.failure(error))
            return
        }
        do {
            let orders = try JSONDecoder().decode([Customers].self, from: data!)
            completion(.success(orders))
        } catch let jsonError {
            completion(.failure(jsonError))
        }
        
    }.resume()
}

