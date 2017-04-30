//
//  AddIconTableViewController.swift
//  CheckList
//
//  Created by Nesreen Mamdouh on 4/29/17.
//  Copyright © 2017 Nesreen Mamdouh. All rights reserved.
//

import UIKit

class AddIconTableViewController: UITableViewController {
    
    
    var delegateAddIcon :AddIconTableViewControllerDelegate!
    var icons = [#imageLiteral(resourceName: "No Icon"),#imageLiteral(resourceName: "Appointments"),#imageLiteral(resourceName: "Birthdays"),#imageLiteral(resourceName: "Chores"),#imageLiteral(resourceName: "Drinks"),#imageLiteral(resourceName: "Folder"),#imageLiteral(resourceName: "Groceries"),#imageLiteral(resourceName: "Inbox"),#imageLiteral(resourceName: "Photos"),#imageLiteral(resourceName: "Trips")]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            delegateAddIcon.addIcon(self, didFinish: icons[indexPath.row], imageIndex:indexPath.row)
        }
        
        navigationController?.popViewController(animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }


}
protocol AddIconTableViewControllerDelegate:class {
    func addIcon(_ controller : AddIconTableViewController, didFinish item: UIImage , imageIndex:Int )

}
