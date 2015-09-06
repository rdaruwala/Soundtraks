//
//  scheduleViewController.swift
//  Soundtraks
//
//  Created by Rohan Daruwala on 7/25/15.
//  Copyright © 2015 New Trier Soundtraks. All rights reserved.
//

import UIKit

class scheduleViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!

    var concertList:[Concert]!

    
    /**
    Runs when the view is loaded. Loads the two arrays (Colleges and their respective names) from NSUserDefaults.
    **/
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.tag = 0
        //colleges = defaults.objectForKey("Colleges") as? [College]
        
        if let isItEmpty:[Concert] = concertList{}
        else{
            concertList = []
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    Returns the size of the array containing college names
    **/
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return concertList.count
    }
    
    /**
    Sets the table view
    **/
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = concertList[indexPath.row].name
        return cell
        
    }
    
    /**
    Removes a college from the table view list
    **/
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            concertList.removeAtIndex(indexPath.row)
            saveData()
            tableView.reloadData()
        }
    }
    
    /**
    Runs when the + button is tapped. Creates an alert to add a new college to the list
    **/
    @IBAction func onPlusButtonAction(sender: UIBarButtonItem) {
        /*let alert = UIAlertController(title: "Add new concert", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Concert Name"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default) { (action) -> Void in
            let newConcertTextField = alert.textFields![0] as UITextField
            let newConcert:Concert = Concert(name: newConcertTextField.text!)
            self.concertList.append(newConcert)
            self.saveData()
            self.tableView.reloadData()
        }
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)*/
        self.performSegueWithIdentifier("liveConcert", sender: self)
    }
    
    /**
    Runs when the edit button is tapped. Enables if edit is disabled, and disables if edit is enabled.
    **/
    @IBAction func editButtonAction(sender: UIBarButtonItem) {
        if(sender.tag == 0){
            tableView.editing = true
            sender.tag = 1
        }
        else{
            tableView.editing = false
            sender.tag  = 0
        }
    }
    
    /**
    Saves the data to NSUserDefaults
    **/
    func saveData(){
        
    }
    
    /**
    Sends a college name to the next view controller for displaying/editing
    **/
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! liveConcertViewController
        let index = tableView.indexPathForSelectedRow?.row
        destination.concertRecieved = concertList[index!]
        
    }
    
}

