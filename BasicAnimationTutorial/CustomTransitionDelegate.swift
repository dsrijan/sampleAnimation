//
//  CustomTransitionDelegate.swift
//  BasicAnimationTutorial
//
//  Created by dsrijan on 16/06/17.
//  Copyright © 2017 Srijan. All rights reserved.
//

import UIKit

class CustomTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        print("presenting")
        
        let presenting = PresentingTransitionAnimator()
        return presenting
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        print("dismissing")

        
        let dismissing = DismissionTransitionAnimator()
        return dismissing
        
    }
    

}
