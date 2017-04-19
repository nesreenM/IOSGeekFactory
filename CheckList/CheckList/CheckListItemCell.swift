//
//  CheckListItemCell.swift
//  CheckList
//
//  Created by Nesreen Mamdouh on 4/17/17.
//  Copyright © 2017 Nesreen Mamdouh. All rights reserved.
//

import UIKit

class CheckListItemCell: UITableViewCell {

    @IBOutlet var itemTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
