//
//  liveConcertViewController.swift
//  Soundtraks
//
//  Created by Rohan Daruwala on 7/25/15.
//  Copyright © 2015 New Trier Soundtraks. All rights reserved.
//

import UIKit

class finalConcertEditor: UIViewController {
    
    var concertRecieved:Concert!
    var schedule:[[String:String]]!

    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveButton.backgroundColor = UIColor.clearColor()
        saveButton.layer.cornerRadius = 10
        saveButton.layer.borderWidth = 3
        saveButton.layer.borderColor = UIColor.blueColor().CGColor
        
        schedule = [["":""]]
        
        textField.text = concertRecieved.rawShiftText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func onSaveButtonTap(sender: AnyObject) {
        let stuff = textField.text
            let mainBody:[String] = stuff.componentsSeparatedByString("\n\n")
            for(var i = 0; i < mainBody.count; i++){
                let eachShift:[String] = mainBody[i].componentsSeparatedByString("\n")
                for(var j = 0; j < eachShift.count; j++){
                    if(separateAndSave(eachShift[j], i: i)){
                        
                    }
                    else{
                        let alert = UIAlertController(title: "Error!", message: "There is a syntax error.", preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {void in
                            //nothing
                        }))
                        self.presentViewController(alert, animated: true, completion: nil)
                    }
                }
            }
        concertRecieved.rawShiftText = stuff
        concertRecieved.shiftSchedule = schedule
    }
    
    func separateAndSave(todo: String, i: Int)->Bool{
        if let separated:[String] = todo.componentsSeparatedByString(":"){
            if(separated.count == 2){
                let position = separated[0]
                let person = separated[1]
                schedule[i][position] = person
                return true
            }
            else{
                return false
            }
        }
        else{
            return false
        }
    }
    

}
