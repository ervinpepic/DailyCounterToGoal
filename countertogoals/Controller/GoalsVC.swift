//
//  GoalsVC
//  countertogoals
//
//  Created by Ervin on 13/01/2018.
//  Copyright © 2018 Ervin Pepic. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {
    
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!

    //Constants
    
    
    //variables
     var goals: [Goal] = []
    
    //functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        
        tableView.reloadData()
    }
    
    func fetchCoreDataObjects() {
        self.fetchData { (complete) in
            if complete {
                if goals.count >= 1 {
                    tableView.isHidden = false
                    
                } else {
                    tableView.isHidden = true
                }
            }
        }
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
        return goals.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell() }
        let goal = goals[indexPath.row]
        cell.configureCell(goal: goal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Remove") { (rowAction, indexPath) in
            self.removeGoal(atIndexpath: indexPath)
            self.fetchCoreDataObjects()
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        let addActioon = UITableViewRowAction(style: .normal, title: "Add 1") { (rowAction, indexP) in
            self.setProgress(atIntexPath: indexP)
            tableView.reloadRows(at: [indexP], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        addActioon.backgroundColor = #colorLiteral(red: 0.2375172675, green: 0.6307491064, blue: 0.5832262635, alpha: 1)
        return [deleteAction, addActioon]
    }
}

extension GoalsVC {
    
    
    func setProgress(atIntexPath indexP: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let chosenGoal = goals[indexP.row]
        
        if chosenGoal.goalProgress < chosenGoal.goalCompletionValue {
            chosenGoal.goalProgress = chosenGoal.goalProgress + 1
        } else {
            return
        }
        do {
            try managedContext.save()
            print("saved success")
        } catch {
            debugPrint(error.localizedDescription)
        }
        
    }
    
    func removeGoal(atIndexpath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        managedContext.delete(goals[indexPath.row])
        do {
            try managedContext.save()
            print("success removed goal")
        } catch {
            debugPrint("Error while deleting:\(error.localizedDescription)")
            
        }
    }
    
    func fetchData(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchdataRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            goals = try managedContext.fetch(fetchdataRequest)
            print("Data get Success")
            completion(true)
            
        } catch {
            debugPrint("Could not get data from coredata:\(error.localizedDescription)")
        }
        
    }
}
