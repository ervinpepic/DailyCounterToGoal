//
//  GoalCell.swift
//  countertogoals
//
//  Created by Ervin on 13/01/2018.
//  Copyright © 2018 Ervin Pepic. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var goalDesc: UILabel!
    @IBOutlet weak var goalTyoe: UILabel!
    @IBOutlet weak var goalProgress: UILabel!
    
    
    
    //Constants
    
    
    //variables
    
    
    //functions
 
    func configureCell(description: String, type: GoalType, goalProgressAmount: Int) {
        self.goalDesc.text = description
        self.goalTyoe.text = type.rawValue
        self.goalProgress.text = String(describing: goalProgressAmount)
    }
    
    
    //Actions

}
