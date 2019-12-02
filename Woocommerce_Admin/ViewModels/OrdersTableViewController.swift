//
//  OrdersTableViewController.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 25/11/2019.
//  Copyright © 2019 Halliday. All rights reserved.
//

import UIKit

class OrdersTableViewController: UITableViewController {
    
    //var tableData = [Orders]()
    
    var pendingQuotes = [Orders]()
    var completeQuotes = [Orders]()
    
    var CustomerId: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:  #selector(refreshTable), for: .valueChanged)
        self.refreshControl = refreshControl
        
        print(OrderStatus.PaymentPending.rawValue)
    }
    
    @objc func refreshTable() {
        LoadOrders()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if pendingQuotes.count + completeQuotes.count == 0 { LoadOrders() }
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0:
            return "Received Quote"
        case 1:
            return "Complete Quote"
        default:
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case 0:
            return pendingQuotes.count
        case 1:
            return completeQuotes.count
        default:
            break
        }
        return 0
    }
    
    // MARK: - Table view cell data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        switch (indexPath.section) {
        case 0:
            cell.textLabel?.text = String("#\(self.pendingQuotes[indexPath.row].id)")
            cell.textLabel?.textColor = UIColor.init(named: "orderNumber")
            cell.detailTextLabel?.text = String("\(self.pendingQuotes[indexPath.row].billing.first_name) \(self.pendingQuotes[indexPath.row].billing.last_name)")
        case 1:
            cell.textLabel?.text = String("#\(self.completeQuotes[indexPath.row].id)")
            cell.textLabel?.textColor = UIColor.init(named: "orderNumber")
            cell.detailTextLabel?.text = String("\(self.completeQuotes[indexPath.row].billing.first_name) \(self.completeQuotes[indexPath.row].billing.last_name)")
        default:
            break
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "orderDetails")
        {
            let section = self.tableView.indexPathForSelectedRow?.section
            switch section {
            case 0:
                let orderDetailsVC = segue.destination as? OrderDetailsTableViewController
                orderDetailsVC?.title = "Order #\(String(self.pendingQuotes[self.tableView.indexPathForSelectedRow!.row].id))"
                orderDetailsVC?.tableData.append(self.pendingQuotes[self.tableView.indexPathForSelectedRow!.row])
                break
            case 1:
                let orderDetailsVC = segue.destination as? OrderDetailsTableViewController
                orderDetailsVC?.title = "Order #\(String(self.completeQuotes[self.tableView.indexPathForSelectedRow!.row].id))"
                orderDetailsVC?.tableData.append(self.completeQuotes[self.tableView.indexPathForSelectedRow!.row])
            default:
                break
            }
            
        }
    }
    
    // MARK: - Load order data
    private func LoadOrders(){
        self.showSpinner()
        GetOrders(orderNum: nil, customerId: CustomerId) { (res) in
            switch res {
            case .success(let orders):
                print(orders)
                //self.tableData = orders
                for items in orders{
                    if items.status == OrderStatus.PaymentPending.rawValue { self.pendingQuotes.append(items) }
                    else if items.status == OrderStatus.Completed.rawValue { self.completeQuotes.append(items) }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.removeSpinner(indicator: .none)
                    self.refreshControl?.endRefreshing()
                }
            case .failure(let err):
                self.removeSpinner(indicator: .failed, completionLabel: "Failed loading data", completionTimeout: 1.0)
                print("Failed to fetch", err)
            }
        }
    }
}
