//
//  UserViewController.swift
//  FinalProject
//
//  Created by Thanh Nguyen on 10/22/15.
//  Copyright © 2015 thanhcs. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    var data:DataModel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "User mode"  // set to admin right now
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "addViewSegue") {
            let view = segue.destinationViewController as? AddNewEventViewController
            view?.data = data
        } else if (segue.identifier == "editViewSegue") {
            let view = segue.destinationViewController as? EditTableViewController
            view?.data = data
        }
    }

}
