//
//  ViewController.swift
//  MyToDoey
//
//  Created by Dara Klein on 7/8/18.
//  Copyright © 2018 Dara Klein. All rights reserved.
//

import UIKit

class ToDoListVC: UITableViewController {

    var itemArray = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let newItem = Item()
        newItem.title = "Call to order contacts"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Cokes"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Buy Purified Water"
        itemArray.append(newItem3)
        
    }

 
//MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Datasource Method called again")
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = itemArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = item.title

        //value = condition ? valueIfTrue : valueIfFalse
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
     
    }
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            print("success")
          
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            self.tableView.reloadData()

        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            //print(alertTextField)
        }
        alert.addAction(action)
    present(alert, animated: true, completion: nil)
        
    }
    
}

