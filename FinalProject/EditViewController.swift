//
//  EditViewController.swift
//  FinalProject
//
//  Created by Thanh Nguyen on 10/22/15.
//  Copyright © 2015 thanhcs. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {
    
    var data:DataModel? = nil
    var index:Int = 0

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var hostTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var capacityTextField: UITextField!
    @IBOutlet weak var alertEmpty: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let temp = data?.getEvent(index: index)
        
        // display the old value
        titleLabel.text = temp?.title
        dateTextField.text = temp?.date
        locationTextField.text = temp?.location
        hostTextField.text = temp?.host
        descriptionTextField.text = temp?.desc
        let c = temp?.capacity
        capacityTextField.text = "\(c!)"

        // Do any additional setup after loading the view.
        dateTextField.delegate = self
        locationTextField.delegate = self
        hostTextField.delegate = self
        descriptionTextField.delegate = self
        capacityTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateEvent(sender: AnyObject) {
        // TODO: need to check if nil
        if (dateTextField.text == "" || locationTextField.text == "" || hostTextField.text == "" || descriptionTextField.text == "" || capacityTextField.text == "") {
            alertEmpty.text = "You have to fill in all information"
        } else {
        data?.UpdateEvent(index: index, title: titleLabel.text!, date: dateTextField.text!, location: locationTextField.text!, host: hostTextField.text!, description: descriptionTextField.text!, capacity: Int(capacityTextField.text!)!)
            alertEmpty.text = "Saved!"
        }
    }
    
    // dismiss the keyboard when touching anywhere
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    // dismiss the keyboard when touching the return key
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}
