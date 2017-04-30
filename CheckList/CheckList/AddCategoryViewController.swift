//
//  AddCategoryViewController.swift
//  CheckList
//
//  Created by Nesreen Mamdouh on 4/28/17.
//  Copyright © 2017 Nesreen Mamdouh. All rights reserved.
//

import UIKit

class AddCategoryViewController : UITableViewController,AddIconTableViewControllerDelegate{
    
    @IBOutlet var categoryNameTextField: UITextField!
    var categoryDelegate :AddCategoryViewControllerDelegate!
    var category_item: CategoryItem!
    let category_Item = CategoryItem ()
    var itemToEdit = CategoryItem()
    @IBOutlet var imageIconView: UIImageView!
    @IBOutlet var imageNameLabel: UILabel!
    var categoryToEdit : CategoryItem?
    
     var iconsNames = ["No Icon","Appointments ","Birthday","Chores","Drinks","Folder","Groceries","Inbox","Photos","Trips"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if categoryToEdit == nil
        {
            categoryToEdit?.categoryName = categoryNameTextField.text!
        }
        else
        {
            categoryNameTextField.text = categoryToEdit?.categoryName
        }
        
    }
    
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        
        
        if let category = categoryToEdit {
            category.categoryName = categoryNameTextField.text ?? ""
            categoryDelegate.editCategory(self, didFinish: category)
            print("edit")

        }
        
        else
        {
            
            if categoryNameTextField.text == ""{
                
                let alert = UIAlertController(title: "Alert", message: "Please enter category name", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                
            }
            else
            {
                category_Item.categoryName = categoryNameTextField.text ?? ""
                category_Item.image = itemToEdit.image ?? #imageLiteral(resourceName: "No Icon")
                categoryDelegate.addCategory(self, didFinishAdding: category_Item)
            }
        }
        
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        
        categoryDelegate.addCategoryDidCancel(self)
        print("edit cancel")
    }
    
    func addIcon(_ controller : AddIconTableViewController, didFinish item: UIImage,imageIndex:Int ){
        
        itemToEdit.image = item
        imageIconView.image = item
        imageNameLabel.text = iconsNames[imageIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ChooseImageController"{
            
            if let navigationControler = segue.destination as? UITableViewController{
                let controller = navigationControler as! AddIconTableViewController
                controller.delegateAddIcon = self
            }
        }
    }
    
}

protocol AddCategoryViewControllerDelegate :class {
    
    func addCategory(_ controller: AddCategoryViewController , didFinishAdding item: CategoryItem)
    func addCategoryDidCancel (_ controller:AddCategoryViewController )
    func editCategory(_ controller : AddCategoryViewController,  didFinish item: CategoryItem)
}
