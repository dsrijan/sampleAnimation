//
//  ViewController.swift
//  BasicAnimationTutorial
//
//  Created by dsrijan on 16/06/17.
//  Copyright © 2017 Srijan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var circleCenter: CGPoint!
    @IBOutlet weak var customActionSheet: UIButton!
    
    @IBAction func panGestureExample(_ sender: Any) {
        let pv = PanGestureViewController()
        self.navigationController?.pushViewController(pv, animated: true)
    }
    
    @IBAction func coreAnimationSampleExample(_ sender: Any) {
        let pv = CoreAnimationsViewController()
        self.navigationController?.pushViewController(pv, animated: true)
    }
    
    @IBAction func customAnimationTransition(_ sender: Any) {
        let pv = CustomAnimationTransitionViewController()
        self.navigationController?.pushViewController(pv, animated: true)
    }
    
    @IBAction func collectionViewSample(_ sender: Any) {
        print("collectionViewSample")
        let pv = CustomCollectionViewController()
        self.navigationController?.pushViewController(pv, animated: true)
    }
    
    @IBAction func customActionSheetAction(_ sender: Any) {
        print("hello")
//        let actionSheet = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
//        
//        let margin:CGFloat = 10.0
//        let rect = CGRect(x: margin, y: margin, width: actionSheet.view.bounds.size.width - margin * 4.0, height: 120)
//        let customView = UIView(frame: rect)
//        customView.backgroundColor = .green
//        actionSheet.view.addSubview(customView)
//        
//        let action1 = UIAlertAction(title: "First", style: .default, handler: nil)
//        let action2 = UIAlertAction(title: "Second", style: .destructive, handler: nil)
//        let action3 = UIAlertAction(title: "Third", style: .cancel, handler: nil)
//        actionSheet.addAction(action1)
//        actionSheet.addAction(action2)
//        actionSheet.addAction(action3)
//        self.present(actionSheet, animated: true, completion: nil)
        
        let controller = CustomAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        controller.addAction(UIAlertAction(title: "Reset to default", style: .destructive, handler: nil))
        controller.addAction(UIAlertAction(title: "Save", style: .default, handler: nil))
        
        self.present(controller, animated: true, completion: nil)
        
    }
    
    @IBAction func gradientAction(_ sender: Any) {
        
        let pv = GradientExampleViewController()
        self.navigationController?.pushViewController(pv, animated: true)
        
    }
    @IBAction func popOverAction(_ sender: Any) {
        let pv = SamplePopViewController()
        self.navigationController?.pushViewController(pv, animated: true)
    }
    
    @IBAction func sampleToolBar(_ sender: Any) {
        let pv = ToolBarSampleViewController()
        self.navigationController?.pushViewController(pv, animated: true)

    }
    @IBAction func toolbarSample(_ sender: Any) {
        print("working or not??")
        let pv = ToolBarSampleViewController()
        self.navigationController?.pushViewController(pv, animated: true)
    }
   override func viewDidLoad() {
        super.viewDidLoad()
    }
}

