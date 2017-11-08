//
//  PoppingViewController.swift
//  BasicAnimationTutorial
//
//  Created by dsrijan on 03/07/17.
//  Copyright © 2017 Srijan. All rights reserved.
//

import UIKit

class PoppingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let newFrame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y , width: 250, height: 400)
        
        self.view.frame = newFrame;
        
        let scrollview = UIScrollView(frame: self.view.frame)
        self.view.addSubview(scrollview)
        
        scrollview.contentSize.height = 450
        

        // Do any additional setup after loading the view.
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
