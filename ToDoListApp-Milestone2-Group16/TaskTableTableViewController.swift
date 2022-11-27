//
//  TaskTableTableViewController.swift
//  ToDoListApp-Milestone2-Group16
//
//  Created by Wilson Mungai on 2022-11-27.
//

import UIKit

class TaskTableViewController: UITableViewController
{

    // Array of number of tasks
    var tasks = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // setup
        if !UserDefaults().bool(forKey: "setup")
        {
            // setup the defaults
            // If this is true we wont checj it again
            UserDefaults().set(true, forKey: "setup" )
            
            // setup the values for the key
            // count is the number of tasks that we currently have
            UserDefaults().set(0, forKey: "count" )
            
            // Get all the current saved tasks when the view loads
            updateTasks()
            
            // Reload our data
            tableView.reloadData()
        }
    }
    
}
    
