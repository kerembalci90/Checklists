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
    
    func toggleChecked() {
        isChecked = !isChecked
    }
}
