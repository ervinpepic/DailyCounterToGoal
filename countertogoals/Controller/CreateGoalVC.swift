//
//  CreateGoalVC.swift
//  countertogoals
//
//  Created by Ervin on 14/01/2018.
//  Copyright © 2018 Ervin Pepic. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

    // Outlets
    
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTerm: UIButton!
    @IBOutlet weak var longTerm: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    //Constants
    
    //Variable
    var goalType: GoalType = .shortTerm
    
    //Functions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.bindToKeyboard()
        shortTerm.setSelectedColor()
        longTerm.setDeselectedColor()
        goalTextView.delegate = self
    }

    //Actions

    @IBAction func nextBtnPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your wish or goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinsihGoalVC")as? FinisihGoalVC else { return }
            finishGoalVC.initData(description: goalTextView.text!, type: goalType)
            presentingViewController?.presentSecondaruDetail(finishGoalVC)
        }
    }
    @IBAction func shortTermButtonPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTerm.setSelectedColor()
        longTerm.setDeselectedColor()
    }
    @IBAction func longTermButtonPressed(_ sender: Any) {
        goalType = .longTerm
        longTerm.setSelectedColor()
        shortTerm.setDeselectedColor()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        
    }
    
}


//Extensions
