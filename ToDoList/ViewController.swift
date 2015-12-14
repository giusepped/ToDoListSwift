//
//  ViewController.swift
//  ToDoList
//
//  Created by Giuseppe De Santis on 09/12/15.
//  Copyright © 2015 Giuseppe De Santis. All rights reserved.
//

import UIKit

typealias Task = (name:String, status:Bool)

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var toDoTextField: UITextField!
    
    var toDoArray : [Task] = []
    
    func addStringToArray(toDoString : String) {
        let task = Task(name:toDoString, status:false)
        toDoArray.append(task);
        tableView.reloadData()
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        let toDoText = toDoTextField.text
        addStringToArray(toDoText!)
        toDoTextField.text = ""
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        let testData : [String] = ["eat", "sleep", "laundry", "laundry", "laundry", "laundry", "laundry", "laundry", "laundry", "laundry", "laundry", "code", "debug", "refactor", "commit"]
        for test in testData { addStringToArray(test) }
        tableView.delegate = self;
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: TableView DataSource and Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int { return 1 }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return toDoArray.count }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifer = "ToDoCell";
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer, forIndexPath: indexPath) as! ToDoCell;
        let task = toDoArray[indexPath.row]
        cell.displayTask(task)
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDoArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        toDoArray[indexPath.row].status = !toDoArray[indexPath.row].status
        tableView.reloadData()
    }
}

