//
//  concertEditorViewController.swift
//  Soundtraks
//
//  Created by Rohan Daruwala on 7/25/15.
//  Copyright © 2015 New Trier Soundtraks. All rights reserved.
//

import UIKit

class concertEditorViewController: UIViewController {
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var concertList:[Concert]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        submitButton.backgroundColor = UIColor.clearColor()
        submitButton.layer.cornerRadius = 10
        submitButton.layer.borderWidth = 3
        submitButton.layer.borderColor = UIColor.blueColor().CGColor
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func onSubmitButtonPress(sender: AnyObject) {
        if(eventNameTextField.text != "" && eventNameTextField.text != nil && locationTextField.text != nil && locationTextField.text != ""){
            
            let newConcert = Concert(name: eventNameTextField.text!, date: datePicker.date, location: locationTextField.text!)
            
            
            let alert = UIAlertController(title: "Saved", message: "This concert has been created successfully!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: {void in
                self.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
    }
    
}
