//
//  studentAreaLoginViewController.swift
//  Soundtraks
//
//  Created by Rohan Daruwala on 7/19/15.
//  Copyright © 2015 New Trier Soundtraks. All rights reserved.
//

import UIKit
import Parse

class studentAreaLoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rememberPasswordSwitch: UISwitch!
    @IBOutlet weak var activityMonitor: UIActivityIndicatorView!
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
    
    @IBAction func onBackButtonTap(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func onLoginButtonTap(sender: AnyObject) {
        if(usernameTextField.text != nil && usernameTextField.text != "" && passwordTextField.text != nil && passwordTextField.text != ""){
            activityMonitor.hidden = false
            activityMonitor.startAnimating()
            
            PFUser.logInWithUsernameInBackground(usernameTextField.text!, password: passwordTextField.text!) {
                (user: PFUser?, error: NSError?) -> Void in
                if user != nil {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.performSegueWithIdentifier("login2schedule", sender: self)
                    }
                } else {
                    self.activityMonitor.stopAnimating()
                    self.activityMonitor.hidden = true
                    
                    if let message: AnyObject = error!.userInfo["error"] {
                        self.invalidLoginLabel.text = message as! String
                    }
                    
                    self.invalidLoginLabel.hidden = false
                }
            }
        }
        
    }
    
}
