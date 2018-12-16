//
//  Checklist.swift
//  Checklists
//
//  Created by Kerem BALCI on 2018-11-24.
//  Copyright © 2018 Hextorm. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var iconName = "No Icon"
    var lists = [Checklist]()
    var items = [ChecklistItem]()
    
    init(name: String, iconName: String = "No Icon") {
        self.name = name
        self.iconName = iconName
        super.init()
    }
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items where !item.isChecked {
            count += 1
        }
        
        return count
    }
}
