//
//  CategoryCell.swift
//  CheckList
//
//  Created by Nesreen Mamdouh on 4/28/17.
//  Copyright © 2017 Nesreen Mamdouh. All rights reserved.
//

import UIKit

class CategoryCell : UITableViewCell{
    
    @IBOutlet var categoryImage: UIImageView!
    
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var cateogryLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
