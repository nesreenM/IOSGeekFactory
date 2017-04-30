//
//  AddItemViewControllerDelegate.swift
//  CheckList
//
//  Created by Nesreen Mamdouh on 4/22/17.
//  Copyright © 2017 Nesreen Mamdouh. All rights reserved.
//

import Foundation

protocol AddItemViewControllerDelegate:class {
    
    func addItemViewControllerDidCancel(_ controller:AddItemController)
    
    func addItemViewController(_ controller: AddItemController  , didFinishAdding item: CheckListItem) 
}
