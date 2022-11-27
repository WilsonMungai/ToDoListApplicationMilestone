//
//  TaskViewController.swift
//  ToDoListApp-Milestone2-Group16
//
//  Created by Wilson Mungai on 2022-11-27.
//

import UIKit

class TaskViewController: UIViewController
{
    // Deletion Handler
    public var deletionHandler: (() -> Void)?
    
    @IBOutlet weak var taskName: UILabel!
    
    @IBOutlet weak var taskNotes: UILabel!
    
    @IBOutlet weak var taskDueDate: UILabel!
    
    var task : String?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        taskName.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteTask))

    }

    @objc func deleteTask()
    {
        
    }
}
