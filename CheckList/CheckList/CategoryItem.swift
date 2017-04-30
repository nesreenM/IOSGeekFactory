//
//  CategoryItem.swift
//  CheckList
//
//  Created by Nesreen Mamdouh on 4/28/17.
//  Copyright © 2017 Nesreen Mamdouh. All rights reserved.
//

import Foundation
import UIKit

class CategoryItem :NSObject,NSCoding{
    
    // list of items
    // image
    // label
    
    var categoryName = ""
    var image :UIImage!
    var categoryItems = [CheckListItem]()
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(categoryName, forKey: "CategoryName")
        aCoder.encode(image , forKey: "Image")
        aCoder.encode(categoryItems, forKey: "Items")
    }
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        categoryName = aDecoder.decodeObject(forKey: "CategoryName") as! String
        image = aDecoder.decodeObject(forKey:"Image") as! UIImage
        categoryItems = aDecoder.decodeObject(forKey: "Items") as! [CheckListItem]
        super.init()
    }
    
    
}
