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
    var lists = [Checklist]()
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
