//
//  ToolBarSampleViewController.swift
//  BasicAnimationTutorial
//
//  Created by dsrijan on 04/07/17.
//  Copyright © 2017 Srijan. All rights reserved.
//

import UIKit

class ToolBarSampleViewController: UIViewController {

    private var myToolbar: UIToolbar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
        let textField = UITextField(frame: CGRect(x: 10, y: 100, width: 90, height: 50))
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.lightGray
        self.view.addSubview(textField)
        
        
        // make uitoolbar instance
        myToolbar = UIToolbar(frame: CGRect(x: 0, y: self.view.bounds.size.height - 44, width: self.view.bounds.size.width, height: 40.0))
        
        // set the position of the toolbar
        myToolbar.layer.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height-20.0)
        
        // set the color of the toolbar
        myToolbar.barStyle = .default
        myToolbar.tintColor = UIColor.purple
        myToolbar.backgroundColor = UIColor.blue
        // make a button
        let myUIBarButtonGreen: UIBarButtonItem = UIBarButtonItem(title: "Green", style:.plain, target: self, action: #selector(self.onClickBarButton))
        myUIBarButtonGreen.tag = 1
        
        let myUIBarButtonBlue: UIBarButtonItem = UIBarButtonItem(title: "Blue", style:.plain, target: self, action: #selector(self.onClickBarButton))
        myUIBarButtonBlue.tag = 2
        
        let myUIBarButtonRed: UIBarButtonItem = UIBarButtonItem(title: "Red", style:.plain, target: self, action: #selector(self.onClickBarButton))
        myUIBarButtonRed.tag = 3
        
        // add the buttons on the toolbar
        myToolbar.items = [myUIBarButtonGreen, myUIBarButtonBlue, myUIBarButtonRed]
        
        // add the toolbar to the view.
        self.view.addSubview(myToolbar)

        // Do any additional setup after loading the view.
    }
    
    // called when UIBarButtonItem is clicked.
    internal func onClickBarButton(sender: UIBarButtonItem) {
        
        switch sender.tag {
        case 1:
            self.view.backgroundColor = UIColor.green
        case 2:
            self.view.backgroundColor = UIColor.blue
        case 3:
            self.view.backgroundColor = UIColor.red
        default:
            print("ERROR!!")
        }
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
