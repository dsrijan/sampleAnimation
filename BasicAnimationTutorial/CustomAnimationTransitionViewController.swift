//
//  CustomAnimationTransitionViewController.swift
//  BasicAnimationTutorial
//
//  Created by dsrijan on 16/06/17.
//  Copyright © 2017 Srijan. All rights reserved.
//

import UIKit

class CustomAnimationTransitionViewController: UIViewController, SampleDelegate {

    var circle : UIButton!
    
    var transitionDelegate = CustomTransitionDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        circle = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        circle.center = self.view.center
        circle.setTitle("+", for: .normal)
        circle.titleLabel?.font = UIFont(name: "Helvetica", size: 52.0)
        circle.setTitleColor(UIColor.white, for: .normal)
        circle.layer.cornerRadius = 50.0
        circle.backgroundColor = UIColor.green
        self.view.addSubview(circle)
        
        circle.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)


        // Do any additional setup after loading the view.
    }
    
    func getName(name: String) {
        print("<<<<<<<<<<<\(name)")
    }
    
    
    func buttonClicked(sender : UIButton)  {
        print("button clicked")
        let pv = SamplePresentingViewController()
         pv.delegate = self
        let rv = UINavigationController(rootViewController: pv)
        rv.transitioningDelegate = transitionDelegate
        rv.modalPresentationStyle = .custom
        self.navigationController?.present(rv, animated: true, completion: nil)
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
