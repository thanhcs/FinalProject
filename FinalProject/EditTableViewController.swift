//
//  EditTableViewController.swift
//  FinalProject
//
//  Created by Thanh Nguyen on 10/22/15.
//  Copyright © 2015 thanhcs. All rights reserved.
//

import UIKit

class EditTableViewController: UITableViewController {
    
    var data:DataModel? = nil
    private var cellReuseIdentifier = "editCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Event Editing"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (data?.countEvents())!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath)
    
        // Configure the cell...
        let index:Int = indexPath.row
        let e = data!.getEvent(index: index)
    
        cell.textLabel!.text = e.title
    
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            data?.deleteEvent(index: indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }    
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "editViewSegue") {
            let indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow!
            let view = segue.destinationViewController as! EditViewController
            view.data = data
            view.index = indexPath.row
            
        }
    }

}
