//
//  GoalsVC
//  countertogoals
//
//  Created by Ervin on 13/01/2018.
//  Copyright © 2018 Ervin Pepic. All rights reserved.
//

import UIKit
import CoreData


class GoalsVC: UIViewController {
    
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //Constants
    
    
    //variables
    
    
    //functions
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
      
    }

    
    //Actions
    @IBAction func AddGoalButton(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return }
        presentDetail(createGoalVC)
    }
    

}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell() }
        cell.configureCell(description: "Jesti zdravo svaki dan", type: .shortTerm, goalProgressAmount: 2)
        return cell
    }
}
