//
//  ViewController.swift
//  ToDoList
//
//  Created by Giuseppe De Santis on 09/12/15.
//  Copyright © 2015 Giuseppe De Santis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var toDoTextField: UITextField!
    
    var toDoArray : [String] = []

    func addStringToArray(toDoString : String) { toDoArray.append(toDoString)
    }
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        let toDoText = toDoTextField.text
        addStringToArray(toDoText!)
        print(toDoArray)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

