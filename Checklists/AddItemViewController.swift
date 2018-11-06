//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Kerem BALCI on 2018-10-31.
//  Copyright © 2018 Hextorm. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }
}
