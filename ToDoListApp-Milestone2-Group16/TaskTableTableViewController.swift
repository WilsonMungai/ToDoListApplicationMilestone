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
    
    // Function to update the tasks in the table view
    func updateTasks ()
    {
        // Remove all elements in the task array to avoid duplicates
        tasks.removeAll()
        
        // Gets the count
        guard let count = UserDefaults().value(forKey: "count") as? Int else
        {
            return
        }
        
        // We want to iterate from 0 upto the count inclusive of the count so that we get each of our tasks and add to the tasks array
        for x in 0..<count
        {
            // The current positon is x where it will start
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String {
                tasks.append(task)
            }
        }
        
        // Reload our data
        tableView.reloadData()
    }
    
}
    
