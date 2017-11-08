//
//  SamplePresentingViewController.swift
//  BasicAnimationTutorial
//
//  Created by dsrijan on 16/06/17.
//  Copyright © 2017 Srijan. All rights reserved.
//

import UIKit

protocol SampleDelegate {
    func getName(name : String)
}

class SamplePresentingViewController: UIViewController {
    
    var delegate : SampleDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
        self.delegate?.getName(name: "Srijan Kumar")
        
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.cancel))
        self.navigationItem.rightBarButtonItem = cancel

        // Do any additional setup after loading the view.
    }
    
    func cancel()  {
        self.dismiss(animated: true, completion: nil)
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
