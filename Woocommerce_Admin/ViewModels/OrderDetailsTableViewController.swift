//
//  OrderDetailsTableViewController.swift
//  Woocommerce_Admin
//
//  Created by Lewis Halliday on 27/11/2019.
//  Copyright © 2019 IT-Developers. All rights reserved.
//

import UIKit
import MessageUI

class OrderDetailsTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {

	var tableData = [Orders]()
	// init empty tuple array
	var orderDetails: [(String, String)] = []
	var billingDetails: [(String, String)] = []
	var productDetails: [(String, String)] = []
	
	// append a value
    
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.rowHeight = UITableView.automaticDimension
		tableView.estimatedRowHeight = 44.0
		
		self.registerTableViewCells()
		
		//Order Details Data
		orderDetails.append(("Order Number", String(tableData[0].id)))
		orderDetails.append(("Total", "£" + tableData[0].total))
		orderDetails.append(("Shipping", "£" + tableData[0].shipping_total))
		orderDetails.append(("Tax", "£" + tableData[0].cart_tax))
		orderDetails.append(("Notes", tableData[0].customer_note))
		
		
		//Billing Details Data
		billingDetails.append(("First Name", tableData[0].billing.first_name))
		billingDetails.append(("Surname", tableData[0].billing.last_name))
		billingDetails.append(("Company", tableData[0].billing.company))
		billingDetails.append(("Address 1", tableData[0].billing.address_1))
		billingDetails.append(("Address 2", tableData[0].billing.address_2))
		billingDetails.append(("City", tableData[0].billing.city))
		billingDetails.append(("Country", tableData[0].billing.country))
		billingDetails.append(("Postcode", tableData[0].billing.postcode))
		billingDetails.append(("Phone", tableData[0].billing.phone))
		billingDetails.append(("Email", tableData[0].billing.email))
		
		//Product Details
		for items in tableData[0].line_items {
			productDetails.append((items.name, items.subtotal))
		}
	}
	
	func registerTableViewCells()
	{
		tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "productCell")
	}

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		switch (section) {
			case 0:
				return orderDetails.count
			case 1:
				return billingDetails.count
			case 2:
				return productDetails.count
			default:
			return 0
		}
    }
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		switch (section) {
			case 0:
				return "Order Details"
			case 1:
				return "Billing Details"
			case 2:
				return "Products"
			default:
				return ""
		}
	}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
		let productCell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
		
		cell.selectionStyle = .none
		cell.textLabel?.lineBreakMode = .byTruncatingTail
		cell.textLabel?.numberOfLines = 0
		switch (indexPath.section) {
			case 0:
				cell.textLabel?.text = orderDetails[indexPath.row].0
				cell.detailTextLabel?.text = orderDetails[indexPath.row].1
				break
			case 1:
				cell.textLabel?.text = billingDetails[indexPath.row].0
				cell.detailTextLabel?.text = billingDetails[indexPath.row].1
				if cell.textLabel?.text == "Phone" { cell.accessoryType = .disclosureIndicator}
				if cell.textLabel?.text == "Email" { cell.accessoryType = .disclosureIndicator}
				break
			case 2:
				productCell.productName.text = productDetails[indexPath.row].0
				productCell.productCost.text = "£" + productDetails[indexPath.row].1
				return productCell
			default:
				break
		}
		
		
        return cell
    }
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let cell = tableView.cellForRow(at: indexPath)
		if cell?.textLabel?.text == "Phone" { makeCall(number: billingDetails[indexPath.row].1) }
		if cell?.textLabel?.text == "Email" { sendEmail(email: billingDetails[indexPath.row].1, sender: self) }
	}
}
