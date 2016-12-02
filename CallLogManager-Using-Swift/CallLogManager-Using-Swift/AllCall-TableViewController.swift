//
//  AllCall-TableViewController.swift
//  CallLogManager-Using-Swift
//
//  Created by Karan on 26/11/16.
//  Copyright © 2016 Karan. All rights reserved.
//

import UIKit

class AllCall_TableViewController: UITableViewController {

    var allCallArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let u1:userInfo=userInfo()
        u1.username="Steve Jobs"
        u1.userimage="user1_70p"
        u1.date="Today"
        u1.callimage="receivecall"
        u1.calltiming="10m 20s"
        
        let u2:userInfo=userInfo()
        u2.username="Deepika"
        u2.userimage="user2_70p"
        u2.date="Yesterday 21-11-2016"
        u2.callimage="missedcall"
        u2.calltiming=" "
        
        
        let u3:userInfo=userInfo()
        u3.username="8888888888"
        u3.userimage="nophoto"
        u3.date="Yesterday 5.15 PM"
        u3.callimage="dialedcall"
        u3.calltiming="5m 10s"
        
        
        let u4:userInfo=userInfo()
        u4.username="Modi";
        u4.userimage="user3_70p";
        u4.date="Yesterday 10.30 AM";
        u4.callimage="dialedcall";
        u4.calltiming="15m 30s";

        
        allCallArray=[u1,u2,u3,u4]
        
        
        
    tableView.registerNib(UINib(nibName: "customTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

        
    let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(AllCall_TableViewController.handleSwipes(_:)))
    leftSwipe.direction = .Left
    view.addGestureRecognizer(leftSwipe)
        
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        let selectedIndex: Int = self.tabBarController!.selectedIndex
        self.tabBarController!.selectedIndex = selectedIndex + 1
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
        return allCallArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:customTableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! customTableViewCell

        let user:userInfo = allCallArray.objectAtIndex(indexPath.row) as! userInfo
        
        // Configure the cell...
        cell.userNameLbl.text=user.username
        cell.userImageView.image=UIImage (named: user.userimage)
        cell.dateLbl.text=user.date
        cell.callTimingLbl.text=user.calltiming
        cell.callImageView.image=UIImage (named: user.callimage)
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
