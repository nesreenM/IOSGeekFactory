//
//  CategoryListViewController.swift
//  CheckList
//
//  Created by Nesreen Mamdouh on 4/28/17.
//  Copyright © 2017 Nesreen Mamdouh. All rights reserved.
//

import UIKit

class CategoryListViewController : UITableViewController,AddCategoryViewControllerDelegate {
    
    public var categoryList = [CategoryItem]()
    
    override func viewDidLoad() {
        self.tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        categoryList.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        saveChecklistItems()

        tableView.deleteRows(at: indexPaths, with: .automatic)
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        configCategoryText(for: cell , at: indexPath)
        configCounter(for: cell , at: indexPath)
        configImage(for: cell , at: indexPath)
    
        return cell
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
 
    func addCategoryDidCancel(_ controller: AddCategoryViewController) {
        dismiss(animated: true, completion: nil)
    }
    func editCategory(_ controller: AddCategoryViewController  , didFinish item: CategoryItem){
        
        let newRowIndex = categoryList.index(of: item)!
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.reloadRows(at: indexPaths, with: .automatic)
        saveChecklistItems()

        
        
    }
    func addCategory(_ controller: AddCategoryViewController, didFinishAdding item: CategoryItem) {
        
        
        let newIndex = categoryList.count
        categoryList.append(item)
        saveChecklistItems()
        let indexPath = IndexPath(row: newIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddCategoryController"{
            if let navigationControler = segue.destination as? UINavigationController{
                let controller = navigationControler.topViewController! as!
                AddCategoryViewController
                
                controller.categoryDelegate = self

            }
        }
        else if segue.identifier == "EditCategoryController"{
            if let navigationControler = segue.destination as? UINavigationController{
                let controller = navigationControler.topViewController! as!
                AddCategoryViewController
                
                controller.categoryDelegate = self
                if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                    controller.categoryToEdit = categoryList[indexPath.row]
                    
                }
            }
        }
        else if segue.identifier == "CategoryListViewController"{
        
            if let navigationControler = segue.destination as? UITableViewController{
                let controller = navigationControler as! ChecklistViewController
                
                if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                    controller.items = categoryList[indexPath.row].categoryItems
                    controller.categoryIndex = indexPath.row
                    controller.delegateCategoryController = self
                    controller.categoryIndex = indexPath.row
               
                    
                }
            }
        }
        
        
        
    }
    func configCategoryText(for cell :CategoryCell , at indexPath: IndexPath){
        
        let category = categoryList[indexPath.row]
        cell.cateogryLabel.text = category.categoryName
        
    }
    func configCounter(for cell :CategoryCell , at indexPath: IndexPath){
        let counter = categoryList[indexPath.row].categoryItems.count
        cell.counterLabel.text = String(counter)
    }
    func configImage(for cell :CategoryCell , at indexPath: IndexPath){
        let category = categoryList[indexPath.row]
        cell.categoryImage.image = category.image
    }
    func saveChecklistItems() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(categoryList, forKey: "Categories")
        archiver.finishEncoding()
        data.write(to: dataFilePath(), atomically: true)
    }
    
    func loadChecklistItems() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
            categoryList = unarchiver.decodeObject(forKey: "Categories") as! [CategoryItem]
            unarchiver.finishDecoding()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        categoryList = [CategoryItem]()
        super.init(coder: aDecoder)
        loadChecklistItems()
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Check_Lists3.plist")
    }
}
