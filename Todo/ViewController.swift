//
//  ViewController.swift
//  Todo
//
//  Created by Duc Tran on 3/15/15.
//  Copyright (c) 2015 Duc Tran. All rights reserved.
//

import UIKit
import CoreData

// Declare that ViewController conforms to the UITableViewDataSource protocol
class ViewController: UIViewController, UITableViewDataSource {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    
    // Model (datasource) for the table view
    // NSManageObject: a single object stored in Core Data. Use, create, edit, save and delete from Core Data persistent store
    // Storing Item entities. The Item has an attribute called "name"
    var items = [String]()
    
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Set the title of the view
        title = "Todos"
        
        // register the UITableViewCell class with the tableView. Dequeue a cell with the reuse identifier
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        let item = items[indexPath.row]
        cell.textLabel?.text = item
        
        return cell
    }


    // MARK: - IBAction
    
    // Allow the user to enter an item
    @IBAction func addItem(sender: AnyObject)
    {
        // Create an alert view
        var alert = UIAlertController(title: "New item", message: "Add a new item", preferredStyle: .Alert)
        
        // Create a save action
        let saveAction = UIAlertAction(title: "Save", style: .Default)
            { (action) -> Void in
                // Add the item from the first textfield in the alert view to the self.items array
                let textField = alert.textFields![0] as UITextField
                self.items.append(textField.text)
                self.tableView.reloadData()         // Reload the table view when a new item is loaded
        }
        
        // create a cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        
        // Add the textfield and two above actions
        alert.addTextFieldWithConfigurationHandler(nil)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        // present the alert view
        presentViewController(alert, animated: true, completion: nil)
        
    }
    

}






















