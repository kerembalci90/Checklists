//
//  AllListsViewController.swift
//  Checklists
//
//  Created by Kerem BALCI on 2018-11-24.
//  Copyright © 2018 Hextorm. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController, ListDetailViewControllerDelegate, UINavigationControllerDelegate {

    var dataModel: DataModel!
    let cellIdentifier = "ChecklistCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.delegate = self
        
        let index = dataModel.indexOfSelectedChecklists
        if index >= 0 && index < dataModel.lists.count {
            let checklist = dataModel.lists[index]
            performSegue(withIdentifier: "ShowChecklist", sender: checklist)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell!
        if let c = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
            cell = c
        } else {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
        
        let checklist = dataModel.lists[indexPath.row]
        cell.textLabel!.text = checklist.name
        let uncheckedCount = checklist.countUncheckedItems()
        if checklist.items.count == 0 {
            cell.detailTextLabel!.text = "No items"
        } else {
            cell.detailTextLabel!.text = uncheckedCount == 0 ? "All Done" : "\(uncheckedCount) Remaining"
        }
        cell.accessoryType = .detailDisclosureButton
        
        return cell
    }
    
    //Edit an item
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "ListDetailViewController") as! ListDetailViewController
        controller.delegate = self
        
        let checklist = dataModel.lists[indexPath.row]
        controller.checklistToEdit = checklist
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //Delete rows
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        dataModel.lists.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    //Send the selected item to next screen
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModel.indexOfSelectedChecklists = indexPath.row
        let checklist = dataModel.lists[indexPath.row]
        performSegue(withIdentifier: "ShowChecklist", sender: checklist)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChecklist" {
            let controller = segue.destination as! ChecklistViewController
            controller.checklist = sender as? Checklist
        } else if segue.identifier == "AddChecklist" {
            let controller = segue.destination as! ListDetailViewController
            controller.delegate = self
        }
    }
    
    //MARK:- ListDetailViewControllerDelegate methods
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist: Checklist) {
        dataModel.lists.append(checklist)
        dataModel.sortChecklists()
        tableView.reloadData()
        
        navigationController?.popViewController(animated: true)
    }
    
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist: Checklist) {
        dataModel.sortChecklists()
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    //MARK:- Navigation Controller Delegates
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController === self {
            dataModel.indexOfSelectedChecklists = -1
        }
    }
}
