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
    @IBOutlet weak var completionView: UIView!
    
    
    
    //Constants
    
    
    //variables
    
    
    //functions
 
    func configureCell(goal: Goal) {
        self.goalDesc.text = goal.goalDescription
        self.goalTyoe.text = goal.goalType
        self.goalProgress.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue {
            self.completionView.isHidden = false
        } else {
            self.completionView.isHidden = true
        }
    }
    
    
    //Actions

}
