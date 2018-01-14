//
//  FinisihGoalVC.swift
//  countertogoals
//
//  Created by Ervin on 14/01/2018.
//  Copyright © 2018 Ervin Pepic. All rights reserved.
//

import UIKit

class FinisihGoalVC: UIViewController, UITextFieldDelegate {
    
    //Outlets
    @IBOutlet weak var SaveGoalButton: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    //vars
    var goalDescription: String!
    var goalType: GoalType!
    
    //functions
    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsTextField.delegate = self
        
        SaveGoalButton.bindToKeyboard()
        
    }

    @IBAction func saveGoal(_ sender: Any) {
        
    }
    

}
