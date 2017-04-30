//
//  ViewController.swift
//  CheckList
//
//  Created by Nesreen Mamdouh on 4/17/17.
//  Copyright © 2017 Nesreen Mamdouh. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController,AddItemViewControllerDelegate {

    var items = [CheckListItem]()
    var delegateCategoryController :CategoryListViewController!
    var categoryIndex: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath) as! CheckListItemCell
       
        configText(for: cell, at: indexPath)
        cell.itemCheckLabel.text = items[indexPath.row].checked ? "✔" : ""

        return cell

    }
    
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        
        items.remove(at: indexPath.row)
        delegateCategoryController.categoryList[categoryIndex].categoryItems.remove(at: indexPath.row)

        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let checklistItem = items[indexPath.row]
        checklistItem.toggleCheck()

        if let cell = tableView.cellForRow(at: indexPath) as? CheckListItemCell{
            
          configCheckMark(for: cell, at: indexPath)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func configCheckMark(for cell :CheckListItemCell , at indexPath: IndexPath){
    
        let item = items[indexPath.row]
        cell.itemCheckLabel.text = item.checked ? "✔" : ""
        
    }
    
    func configText(for cell :CheckListItemCell , at indexPath: IndexPath){
        
        let item = items[indexPath.row]
        cell.itemTitleLabel.text = item.text
        
    }
    
    func addItemViewControllerDidCancel(_ controller:AddItemController){
        
        dismiss(animated: true, completion: nil)
        
    }
    func editItemViewController(_ controller: AddItemController  , didFinishEditing item: CheckListItem){
        
        let newRowIndex = items.index(of: item)!
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.reloadRows(at: indexPaths, with: .automatic)
        
        
    }
    func addItemViewController(_ controller: AddItemController  , didFinishAdding item: CheckListItem){
        
        print(item.text)
        if item.text.isEmpty{
            
            let alert = UIAlertController(title: "Alert", message: "Please enter item name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        }
        else{
        let newRowIndex = items.count
        items.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        delegateCategoryController.categoryList[categoryIndex].categoryItems.append(item)
        tableView.insertRows(at: indexPaths, with: UITableViewRowAnimation.automatic)
        dismiss(animated: true, completion: nil)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddItemViewController"{
            if let navigationControler = segue.destination as? UINavigationController{
                let controller = navigationControler.topViewController! as!
                AddItemController
                controller.delegate = self
            }
        }
        else if segue.identifier == "EditViewController"{
            
            if let navigationControler = segue.destination as? UINavigationController{
                let controller = navigationControler.topViewController! as!
                AddItemController
                controller.delegate = self
            
                if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                    controller.itemToEdit = items[indexPath.row]
                    
                }
            }

        }
    }
}
