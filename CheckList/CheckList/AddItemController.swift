//
//  AddItemController.swift
//  CheckList
//
//  Created by Nesreen Mamdouh on 4/22/17.
//  Copyright © 2017 Nesreen Mamdouh. All rights reserved.
//

import UIKit

class AddItemController: UITableViewController {
   
    @IBOutlet var text_feild: UITextField!
    public weak var delegate :AddItemViewControllerDelegate!
    var check = CheckListItem()
    public var itemToEdit : CheckListItem?

    @IBOutlet var editItemLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if itemToEdit == nil
        {
           itemToEdit?.text = text_feild.text!
        }
        else
        {
            editItemLabel.text = itemToEdit?.text
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    @IBAction func donePressed(_ sender : UIBarButtonItem){
        
        check.text = text_feild.text!
        if let item = itemToEdit
        {
            item.text = text_feild.text ?? ""
            delegate.editItemViewController(self, didFinishEditing: item)

        }
        else
        {
            let item = CheckListItem()
            item.checked = false
            item.text = text_feild.text ?? ""
            delegate.addItemViewController(self, didFinishAdding: item)
            
            
        }
        dismiss(animated: true, completion: nil)
       
    }
    
    @IBAction func cancelPressed(_ sender : UIBarButtonItem){
        delegate.addItemViewControllerDidCancel(self)
    }
 


}
protocol AddItemViewControllerDelegate:class {
    
    func addItemViewControllerDidCancel(_ controller:AddItemController)
    
    func addItemViewController(_ controller: AddItemController  , didFinishAdding item: CheckListItem)
     func editItemViewController(_ controller: AddItemController  , didFinishEditing item: CheckListItem)
}


