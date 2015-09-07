//
//  scheduleViewController.swift
//  Soundtraks
//
//  Created by Rohan Daruwala on 7/25/15.
//  Copyright © 2015 New Trier Soundtraks. All rights reserved.
//

import UIKit
import Parse

class scheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!

    var concertList:[PFObject]!

    
    /**
    Runs when the view is loaded. Loads the two arrays (Colleges and their respective names) from NSUserDefaults.
    **/
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.tag = 0
        let query = PFQuery(className: "Concert")
        query.orderByAscending("date")
        concertList = query.findObjects() as! [PFObject]
        print(concertList)
        if let isItEmpty:[AnyObject] = concertList{}
        else{
            concertList = []
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.reloadData()

    
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
        cell.textLabel?.text = String(concertList[indexPath.row].objectForKey("name")!)
        return cell
        
    }
    
    /**
    Removes a college from the table view list
    **/
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            concertList[indexPath.row].delete()
            concertList.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    /**
    Runs when the + button is tapped. Creates an alert to add a new college to the list
    **/
    @IBAction func onPlusButtonAction(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("table2editor", sender: self)
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
        if(segue.identifier != "table2editor"){
            let destination = segue.destinationViewController as! finalConcertEditor
            let index = tableView.indexPathForSelectedRow?.row
            destination.concertRecieved = concertList[index!] as! PFObject
        }
        
    }
    
}

