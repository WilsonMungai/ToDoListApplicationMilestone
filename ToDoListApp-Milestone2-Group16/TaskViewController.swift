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

class TaskViewController: UIViewController
{
    // Deletion Handler
    public var deletionHandler: (() -> Void)?
    
    @IBOutlet weak var taskName: UILabel!
    
    @IBOutlet weak var taskNotes: UITextView!
    
    @IBOutlet weak var taskDueDate: UILabel!
    
    var task : String?
    var notes : String?
    var taskDate: String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        taskName.text = task
        taskNotes.text = notes
        taskDueDate.text = taskDate
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteTask))
    }

    @objc func deleteTask()
    {
        guard let count = UserDefaults().removeObject(forKey: "count") as? Int else
        {
            return
        }

        let newCount = count - 1

        UserDefaults().set(newCount,forKey: "count")

        // Save the tasks
        UserDefaults().set(taskName,forKey: "task_\(newCount)")

        deletionHandler?()

        navigationController?.popViewController(animated: true)
        
    }
}
