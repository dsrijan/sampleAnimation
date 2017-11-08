//
//  SamplePopViewController.swift
//  BasicAnimationTutorial
//
//  Created by dsrijan on 03/07/17.
//  Copyright © 2017 Srijan. All rights reserved.
//

import UIKit
import SafariServices

class SamplePopViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    var rightBarButton : UIBarButtonItem!
    var centreButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
        
        
        rightBarButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(self.compose))
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        centreButton = UIButton(type: .system)
        centreButton.frame = CGRect(x: self.view.frame.width/2 - 40, y: self.view.frame.height/2 - 22, width: 80, height: 44)
        self.view.addSubview(centreButton)
        centreButton.setTitle("Click Here", for: .normal)
        centreButton.addTarget(self, action: #selector(self.centreButtonClicked), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    
    func centreButtonClicked(){
        print("centre button clicked")
        
        let controller: UIViewController? = PoppingViewController()
        controller?.modalPresentationStyle = .popover
        controller?.preferredContentSize = CGSize(width: 200, height: 200)
        let popController : UIPopoverPresentationController? = controller?.popoverPresentationController
        popController?.permittedArrowDirections = .left
        popController?.delegate = self
        popController?.sourceView = self.view
        popController?.sourceRect = self.centreButton.frame
        present(controller!, animated: true, completion: nil)
        
        
    }
    
    func compose() {
        print("Compose")
        
        
       let url = URL(string: "https://www.google.com/")
        
        let controller = SFSafariViewController(url: url!, entersReaderIfAvailable: true) // let controller = PopViewController()
        // present the controller
        // on iPad, this will be a Popover
        // on iPhone, this will be an action sheet
        controller.modalPresentationStyle = .popover
        controller.preferredContentSize = CGSize(width: 250, height: 400)
        
        // configure the Popover presentation controller
        let popController: UIPopoverPresentationController? = controller.popoverPresentationController
        popController?.permittedArrowDirections = .up
        popController?.delegate = self
        // in case we don't have a bar button as reference
        popController?.sourceView = view
        popController?.sourceRect = CGRect(x: self.view.frame.width - CGFloat(30), y: CGFloat(30), width: CGFloat(10), height: CGFloat(10))
        present(controller, animated: true, completion: { _ in })

        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
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
