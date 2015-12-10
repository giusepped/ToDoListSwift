//
//  ViewController.swift
//  ToDoList
//
//  Created by Giuseppe De Santis on 09/12/15.
//  Copyright © 2015 Giuseppe De Santis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var toDoTextField: UITextField!
    
    var toDoArray : [String] = []

    func addStringToArray(toDoString : String) { toDoArray.append(toDoString); tableView.reloadData()
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        let toDoText = toDoTextField.text
        addStringToArray(toDoText!)
        toDoTextField.text = ""
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad(); tableView.delegate = self; tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: TableView DataSource and Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int { return 1 }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return toDoArray.count }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell { let cellIdentifer = "ToDo"; let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer, forIndexPath: indexPath) as! ToDo; cell.toDoCellLabel.text = toDoArray[indexPath.row]; return cell }
}

