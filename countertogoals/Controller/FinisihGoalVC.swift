//
//  FinisihGoalVC.swift
//  countertogoals
//
//  Created by Ervin on 14/01/2018.
//  Copyright © 2018 Ervin Pepic. All rights reserved.
//

import UIKit
import CoreData



class FinisihGoalVC: UIViewController, UITextFieldDelegate {
    
    //Outlets
    @IBOutlet weak var SaveGoalButton: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    //vars
    var goalDescription: String!
    var goalType: GoalType!
    
    //functions
    func save(completion:(_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            print("Success!!")
            completion(true)
        } catch {
            debugPrint("Coult not save data: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsTextField.delegate = self
        
        SaveGoalButton.bindToKeyboard()
        
    }
//Actions IBACTIONS
    @IBAction func saveGoal(_ sender: Any) {
        if pointsTextField.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismissDetail()
    }
    

}
