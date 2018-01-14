//
//  UIViewControllerExtensions.swift
//  countertogoals
//
//  Created by Ervin on 14/01/2018.
//  Copyright © 2018 Ervin Pepic. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentDetail(_ viewControllerTopPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionMoveIn
        transition.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerTopPresent, animated: false, completion: nil)
    }
    
    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
