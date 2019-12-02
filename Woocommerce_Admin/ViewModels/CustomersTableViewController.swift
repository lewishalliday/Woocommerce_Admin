//
//  CustomersTableViewController.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 26/11/2019.
//  Copyright © 2019 Halliday. All rights reserved.
//

import UIKit


class CustomersTableViewController: UITableViewController {
	
	private var tableData = [Customers]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		LoadCustomers()
	}
	
	// MARK: - Table view data source
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return self.tableData.count
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
		cell.textLabel?.text = "\(self.tableData[indexPath.row].first_name) \(self.tableData[indexPath.row].last_name)"
		cell.detailTextLabel?.text = self.tableData[indexPath.row].billing?.company ?? "Company"
		return cell
	}
	
	private func LoadCustomers(){
		self.showSpinner(message: "Loading...")
		GetCustomers(customerId: nil) { (res) in
			switch res {
				case .success(let customers):
					if customers.count >= 0 { self.tableData = customers
						DispatchQueue.main.async {
							self.tableView.reloadData()
							self.removeSpinner()
						}
					} else {
						print("No Items returned")
						DispatchQueue.main.async {
							self.removeSpinner()
						}
				}
				case .failure(let err):
					self.removeSpinner()
					print("Failed to fetch: ", err)
			}
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if (segue.identifier == "ShowOrder") {
			if let nextViewController = segue.destination as? OrdersTableViewController {
				nextViewController.CustomerId = self.tableData[self.tableView.indexPathForSelectedRow!.row].id
			}
		}
	}
	
}
