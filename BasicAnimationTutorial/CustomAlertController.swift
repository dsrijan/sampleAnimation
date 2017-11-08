//
//  CustomAlertController.swift
//  BasicAnimationTutorial
//
//  Created by dsrijan on 28/06/17.
//  Copyright © 2017 Srijan. All rights reserved.
//

import UIKit
import Photos

class CustomAlertController: UIAlertController, UITableViewDataSource {
    
    private var controller : UITableViewController
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        controller = UITableViewController(style: .plain)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        controller.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        controller.tableView.dataSource = self
        controller.tableView.addObserver(self, forKeyPath: "contentSize", options: [.initial, .new], context: nil)
        self.setValue(controller, forKey: "contentViewController")
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard keyPath == "contentSize" else {
            return
        }
        
        controller.preferredContentSize = controller.tableView.contentSize

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        controller.tableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch(indexPath.row) {
        case 0:
            cell.textLabel?.text = "Upcoming activities"
            let switchView = UISwitch(frame: .zero)
            cell.accessoryView = switchView
            switchView.setOn(true, animated: false)
            break
        case 1:
            cell.textLabel?.text = "Past activities"
            let switchView = UISwitch(frame: .zero)
            cell.accessoryView = switchView
            switchView.setOn(false, animated: false)
            break
        case 2:
            cell.textLabel?.text = "Activities where I am admin"
            let switchView = UISwitch(frame: .zero)
            cell.accessoryView = switchView
            switchView.setOn(true, animated: false)
            break
        case 3:
            cell.textLabel?.text = "Attending"
            let switchView = UISwitch(frame: .zero)
            cell.accessoryView = switchView
            switchView.setOn(true, animated: false)
            break
        case 4:
            cell.textLabel?.text = "Declined"
            let switchView = UISwitch(frame: .zero)
            cell.accessoryView = switchView
            switchView.setOn(true, animated: false)
            break
        case 5:
            cell.textLabel?.text = "Not responded"
            let switchView = UISwitch(frame: .zero)
            cell.accessoryView = switchView
            switchView.setOn(true, animated: false)
            break
        default:
            fatalError()
        }
        
        return cell
    }
}
