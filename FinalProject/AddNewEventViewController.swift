//
//  AddNewEventViewController.swift
//  FinalProject
//
//  Created by Thanh Nguyen on 10/22/15.
//  Copyright © 2015 thanhcs. All rights reserved.
//

import UIKit

class AddNewEventViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var hostTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var capacityTextField: UITextField!
    @IBOutlet weak var alertEmpty: UILabel!
    
    var data:DataModel? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "New Event"

        // Do any additional setup after loading the view.
        self.titleTextField.delegate = self
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
    
    @IBAction func saveEvent(sender: AnyObject) {
        // need to check nil
        if (titleTextField.text == "" || dateTextField.text == "" || locationTextField.text == "" || hostTextField.text == "" || descriptionTextField.text == "" || capacityTextField.text == "") {
            alertEmpty.text = "You have to fill in all information!"
        } else {
        data?.addEvent(title: titleTextField.text!, date: dateTextField.text!, location: locationTextField.text!, host: hostTextField.text!, description: descriptionTextField.text!, capacity: Int(capacityTextField.text!)!)
        
        navigationController?.popViewControllerAnimated(true)
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
