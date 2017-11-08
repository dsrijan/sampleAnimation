//
//  GradientExampleViewController.swift
//  BasicAnimationTutorial
//
//  Created by dsrijan on 04/07/17.
//  Copyright © 2017 Srijan. All rights reserved.
//

import UIKit
import SafariServices

class GradientExampleViewController: UIViewController {

    var rectangularView : UIView!
    var rectangularView2 : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
        rectangularView = UIView(frame: CGRect(x: 10, y: 70, width: self.view.bounds.width - 20, height: 200))
        rectangularView.layer.cornerRadius = 5.0
        rectangularView.layer.shadowColor = UIColor.darkGray.cgColor
        rectangularView.layer.shadowRadius = 5.0
        rectangularView.isUserInteractionEnabled = true
        rectangularView.backgroundColor = UIColor.blue
        self.view.addSubview(rectangularView)

        
        rectangularView2 = UIView(frame: CGRect(x: 10, y: 280, width: self.view.bounds.width - 20, height: 200))
        rectangularView2.layer.cornerRadius = 5.0
        rectangularView2.layer.shadowColor = UIColor.darkGray.cgColor
        rectangularView2.layer.shadowRadius = 5.0
        rectangularView2.isUserInteractionEnabled = true
        rectangularView2.backgroundColor = UIColor.blue
        self.view.addSubview(rectangularView2)

        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapView))
        self.rectangularView.addGestureRecognizer(tapGesture)
        
        addGradient()
        anotherGradient()
        

        // Do any additional setup after loading the view.
    }
    
    func tapView(){
        
        if let url = URL(string: "https://www.hackingwithswift.com/read/\(1 + 1)/") {
            let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            self.navigationController?.pushViewController(vc, animated: true)
        }

        
//        UIView.animate(withDuration: 0.001, delay: 0.001, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: [.beginFromCurrentState], animations: {
//            self.rectangularView.frame.origin.y += 100
//            self.view.backgroundColor = UIColor.lightGray
//        }, completion: nil)
    }
    
    func addGradient() {
        
        print("Hello")
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = self.rectangularView.bounds
        gradientLayer.cornerRadius = 5.0
        gradientLayer.shadowColor = UIColor.darkGray.cgColor
        gradientLayer.shadowRadius = 5.0
        let topColor = UIColor.red.cgColor
        let bottomColor = UIColor.yellow.cgColor
        gradientLayer.colors = [topColor,bottomColor]
        gradientLayer.locations = [0.0, 1.0]
        self.rectangularView.layer.insertSublayer(gradientLayer, at: 0)

        
    
    }
    
    func anotherGradient() {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = self.rectangularView.bounds
        gradientLayer.cornerRadius = 5.0
        gradientLayer.shadowColor = UIColor.darkGray.cgColor
        gradientLayer.shadowRadius = 5.0
        let topColor = UIColor.orange.cgColor
        let bottomColor = UIColor.purple.cgColor
        gradientLayer.colors = [topColor,bottomColor]
        gradientLayer.locations = [0.0, 1.0]
        self.rectangularView2.layer.insertSublayer(gradientLayer, at: 0)

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
