//
//  normalSignupViewController.swift
//  Soundtraks
//
//  Created by Rohan Daruwala on 7/19/15.
//  Copyright © 2015 New Trier Soundtraks. All rights reserved.
//


import UIKit
import Parse

class normalSignUpViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pass1TextField: UITextField!
    @IBOutlet weak var pass2TextField: UITextField!
    @IBOutlet weak var usernameTakenLabel: UILabel!
    @IBOutlet weak var passwordsDontMatchLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTakenLabel.hidden = true
        passwordsDontMatchLabel.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSubmitButtonTap(sender: AnyObject) {
        if(usernameTakenLabel.hidden == false){
            // TODO
        }
    }
    
    @IBAction func usernameEditingDidEndAction(sender: AnyObject) {
        // TODO CHECK IF USERNAME IS TAKEN
    }
    
    @IBAction func onCancelButtonTap(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func passEditingDidEndAction(sender: AnyObject) {
        if(pass2TextField.text != nil && pass2TextField.text != "" && pass1TextField.text != nil && pass1TextField.text != ""){
            if(pass1TextField.text != pass2TextField.text){
                passwordsDontMatchLabel.hidden = false
            }
            else{
                passwordsDontMatchLabel.hidden = true
            }
        }
        
    }
}
