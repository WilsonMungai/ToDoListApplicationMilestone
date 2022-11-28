/*
 Group 16
 Name Bing Pan                               301317241
 Name Wilson Mungai Muguthi                  301287641
 Name Gideon Shewana                         301195064
 
 Last Modification: 27/11/2022
 
 Version 1
 
 Description
 
 A to do list app that list all tasks added in a table view in the table view controller.
 The second page is a ui view controller that has textfield to input tasks details and a
 date picker. There are also switches to enable due date and mark tasks as complete.
 */

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet var taskTextField: UITextField!
    @IBOutlet var taskNotesField: UITextView!
    @IBOutlet var taskDueDate: UITextField!
    
    public var update: (() -> Void)?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        taskTextField.delegate = self
        taskTextField.becomeFirstResponder()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
        
        // Date Picker
        let datePicker = UIDatePicker ()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for:UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels

        taskDueDate.inputView = datePicker
        
        // Assign textfield today's date
        taskDueDate.text = formatDate(date: Date())
        
        taskDueDate.resignFirstResponder()
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
    
    
    @objc func dateChange(datePicker: UIDatePicker)
    {
        taskDueDate.text = formatDate(date: datePicker.date)
    }
    
    func formatDate(date: Date) -> String
    {
        let formartter = DateFormatter ()
        formartter.dateFormat = "MMMM dd, yyyy"
        return formartter.string(from: date)
    }
    
    @IBAction func enableDueDateTapped(_sender: UISwitch)
    {
        
    }
}
