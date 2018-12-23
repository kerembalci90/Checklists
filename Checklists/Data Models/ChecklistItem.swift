//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Kerem BALCI on 2018-10-28.
//  Copyright © 2018 Hextorm. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text = ""
    var isChecked = false
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1
    
    override init() {
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
    
    func toggleChecked() {
        isChecked = !isChecked
    }
}
