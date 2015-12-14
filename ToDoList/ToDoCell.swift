//
//  ToDo.swift
//  ToDoList
//
//  Created by Giuseppe De Santis on 09/12/15.
//  Copyright © 2015 Giuseppe De Santis. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var toDoCellLabel: UILabel!
     
    @IBOutlet weak var doneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayTask(task:Task) {
        toDoCellLabel.text = task.name
        toDoCellLabel.textColor = task.status ? UIColor.grayColor() : UIColor.blackColor()
    }

}
