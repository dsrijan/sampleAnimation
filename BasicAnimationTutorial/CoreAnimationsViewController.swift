//
//  CoreAnimationsViewController.swift
//  BasicAnimationTutorial
//
//  Created by dsrijan on 16/06/17.
//  Copyright © 2017 Srijan. All rights reserved.
//

import UIKit

class CoreAnimationsViewController: UIViewController {
    
    var circle : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        circle = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        circle.center = self.view.center
        circle.setTitleColor(UIColor.white, for: .normal)
        circle.layer.cornerRadius = 50.0
        circle.backgroundColor = UIColor.green
        self.view.addSubview(circle)
        
        circle.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
        
        self.addBasicAnimation()
        
        

        // Do any additional setup after loading the view.
    }
    
    func buttonClicked(sender : UIButton)  {
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.33, initialSpringVelocity: 0.0, options: [], animations: {
            self.circle.transform = self.circle.transform.rotated(
                by: CGFloat(-M_PI_2))
            self.circle.layer.cornerRadius = 50.0
            self.circle.layer.borderWidth = 2.0
            self.circle.layer.borderColor = UIColor.gray.cgColor
        }, completion: nil)
    }
    
    func addBasicAnimation() {
        //let animation = CABasicAnimation(keyPath: "opacity") // https://developer.apple.com/documentation/quartzcore/cabasicanimation
        let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        colorAnimation.fromValue = UIColor.red.cgColor
        colorAnimation.toValue = UIColor.blue.cgColor
        colorAnimation.duration = 1
        colorAnimation.autoreverses = true
        colorAnimation.repeatCount = FLT_MAX
        self.circle.layer.add(colorAnimation, forKey: "fdssffd")
        
        let anotherAnimation = CABasicAnimation(keyPath: "opacity")
        anotherAnimation.fromValue = 1
        anotherAnimation.toValue = 0.5
        anotherAnimation.duration = 1
        anotherAnimation.autoreverses = true
        anotherAnimation.repeatCount = FLT_MAX
        self.circle.layer.add(anotherAnimation, forKey: "opacityAnimation")
        
        
        
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
