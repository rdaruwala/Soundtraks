//
//  signUpViewController.swift
//  Soundtraks
//
//  Created by Rohan Daruwala on 7/18/15.
//  Copyright © 2015 New Trier Soundtraks. All rights reserved.
//

import UIKit
import Parse

class signUpViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pass1TextField: UITextField!
    @IBOutlet weak var pass2textField: UITextField!
    @IBOutlet weak var usernameTakenLabel: UILabel!
    @IBOutlet weak var passwordsDontMatchLabel: UILabel!
    @IBOutlet weak var loginErrorLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var activityMonitor: UIActivityIndicatorView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTakenLabel.hidden = true
        passwordsDontMatchLabel.hidden = true
        activityMonitor.hidden = true
        loginErrorLabel.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancelButtonTap(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onSubmitButtonTap(sender: AnyObject) {
        self.resignFirstResponder()
        activityMonitor.startAnimating()
        if(usernameTakenLabel.hidden == true){
            if(usernameTextField.text != "" && emailTextField.text != "" && pass1TextField.text != "" && pass2textField.text != "" && usernameTextField.text != nil && emailTextField.text != nil && pass1TextField.text != nil && pass2textField.text != nil){
                if(pass1TextField.text == pass2textField.text){
                    let newUser = PFUser()
                    newUser.username = usernameTextField.text
                    newUser.password = pass1TextField.text
                    newUser.email = emailTextField.text
                    
                    newUser.signUpInBackgroundWithBlock {
                        (succeeded: Bool, error: NSError?) -> Void in
                        if error == nil {
                            
                            dispatch_async(dispatch_get_main_queue()) {
                                self.dismissViewControllerAnimated(true, completion: nil)
                                print("REGISTERED YO")
                                self.loginErrorLabel.hidden = true
                            }
                            
                        } else {
                            
                            self.activityMonitor.stopAnimating()
                            self.activityMonitor.hidden = false
                            
                            if let message: AnyObject = error!.userInfo["error"] {
                                self.loginErrorLabel.text = message as! String
                            }
                            
                            self.loginErrorLabel.hidden = false
                        }
                    }
                }
                
            }
        }
    }
    
    @IBAction func usernameEditingDidEndAction(sender: AnyObject) {
        let qualityOfServiceClass = QOS_CLASS_BACKGROUND
        let backgroundQueue = dispatch_get_global_queue(qualityOfServiceClass, 0)
        
        dispatch_async(backgroundQueue,{
            let query = PFUser.query()
            query!.whereKey("username", equalTo: (self.usernameTextField.text?.lowercaseString)!)
            let nameArray = query!.findObjects()
            
            for name in nameArray!{
                if(name.lowercaseString == self.usernameTextField.text?.lowercaseString){
                    self.usernameTakenLabel.hidden = false
                    return
                }
            }
            if(self.usernameTakenLabel.hidden == false){
                self.usernameTakenLabel.hidden = true
            }
            
        })
    }
    
    
    @IBAction func passEditingDidEndAction(sender: AnyObject) {
        if(pass2textField.text != nil && pass2textField.text != "" && pass1TextField.text != nil && pass1TextField.text != ""){
            if(pass1TextField.text != pass2textField.text){
                passwordsDontMatchLabel.hidden = false
            }
            else{
                passwordsDontMatchLabel.hidden = true
            }
        }
        
    }
}
