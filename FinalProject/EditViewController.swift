//
//  EditViewController.swift
//  FinalProject
//
//  Created by Thanh Nguyen on 10/22/15.
//  Copyright © 2015 thanhcs. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    var data:DataModel? = nil
    var index:Int = 0

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var hostTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var capacityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let temp = data?.getEvent(index: index)
        
        titleTextField.text = temp?.title
        dateTextField.text = temp?.date
        locationTextField.text = temp?.location
        hostTextField.text = temp?.host
        descriptionTextField.text = temp?.desc
        let c = temp?.capacity
        capacityTextField.text = "\(c!)"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
