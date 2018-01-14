//
//  CreateGoalVC.swift
//  countertogoals
//
//  Created by Ervin on 14/01/2018.
//  Copyright © 2018 Ervin Pepic. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {

    // Outlets
    
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTerm: UIButton!
    @IBOutlet weak var longTerm: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    //Constants
    
    //Variable
    
    //Functions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    //Actions

    @IBAction func nextBtnPressed(_ sender: Any) {
    }
    @IBAction func shortTermButtonPressed(_ sender: Any) {
    }
    @IBAction func longTermButtonPressed(_ sender: Any) {
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismissDetail()
    }
    
}


//Extensions
