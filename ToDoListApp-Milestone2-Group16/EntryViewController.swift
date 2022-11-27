//
//  EntryViewController.swift
//  ToDoListApp-Milestone2-Group16
//
//  Created by Wilson Mungai on 2022-11-27.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet var taskTextField: UITextField!
    @IBOutlet var taskNotesField: UITextView!
    @IBOutlet var taskDueDate: UITextField!
    
    
    var update: (() -> Void)?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        taskTextField.delegate = self
        taskTextField.becomeFirstResponder()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
            // Selector is a function that we want to reference once the button is clicked
            
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        taskTextField.resignFirstResponder()
        
        saveTask()
        
        return true
    }
    
    // @objc allows this function to be used as a selector
    @objc func saveTask()
    {
        // we want to make sure there is text in this field
        guard let text = taskTextField.text, !text.isEmpty else
        {
            return
        }
        
        // Get the count
        // We use guard to ensure that the count isn't empty
        guard let count = UserDefaults().value(forKey: "count") as? Int else
        {
            return
        }
        
        let newCount = count + 1
        
        UserDefaults().set(newCount,forKey: "count")
        
        // Save the tasks
        UserDefaults().set(text,forKey: "task_\(newCount)")
        
        // The question mark means that this is optional
        // If this update method exists then its called
        
        update?()
        
        // Once the update method is called we dismiss the view controller
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func enableDueDateTapped(_sender: UISwitch)
    {
        
    }
}
