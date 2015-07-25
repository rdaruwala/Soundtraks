//
//  ViewController.swift
//  Soundtraks
//
//  Created by Rohan Daruwala on 7/18/15.
//  Copyright © 2015 New Trier Soundtraks. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    @IBOutlet weak var activityMonitor: UIActivityIndicatorView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var invalidLoginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityMonitor.hidden = true
        invalidLoginLabel.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onStudentAreaButtonTap(sender: AnyObject) {
        self.performSegueWithIdentifier("main2studentAreaSegue", sender: self)
    }
    
    @IBAction func onLoginButtonTap(sender: AnyObject) {
        if(usernameTextField.text != "" && usernameTextField.text != nil && passwordTextField.text != "" && passwordTextField.text != nil){
            // TODO DRUPAL LOGIN
        }
    }
    
        @IBAction func onSignupButtonTap(sender: AnyObject) {
            self.performSegueWithIdentifier("signupSegue", sender: self)
        }
        
}

