//
//  ChecklistItem.swift
//  CheckList
//
//  Created by Nesreen Mamdouh on 4/19/17.
//  Copyright © 2017 Nesreen Mamdouh. All rights reserved.
//

import Foundation

class CheckListItem : NSObject,NSCoding{
    
    var text = ""
    var checked = false
    
    func toggleCheck(){
        checked = !checked
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "Text")
        aCoder.encode(checked, forKey: "Checked")
    }
    
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "Text") as! String
        checked = aDecoder.decodeBool(forKey: "Checked")
        super.init()
    }
    override init() {
        super.init()
    }
    
}
