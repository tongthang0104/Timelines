//
//  TimelineTableViewController.swift
//  Timelines
//
//  Created by Thang H Tong on 11/3/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import UIKit

class TimelineTableViewController: UITableViewController {
    
    //MARK: Properties
    
    
    var posts: [Post] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let currentUser = UserController.shareController.currentUser {
            if posts.count > 0 {
                loadTimeLineForUser(currentUser)
            }
        } else {
            tabBarController?.performSegueWithIdentifier("noCurrentUserSegue", sender: nil)
        }
    }
    
    //MARK: Pull To Refresh
    func pullToRefresh(user: User) {
        PostController.fetchTimeLineForUser(user) { (post) -> Void in
            if let post = post {
                self.posts = post
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                    self.refreshControl?.endRefreshing()
                })
            }else {
                self.refreshControl?.endRefreshing()
            }
        }
        
    }
    
    @IBAction func userRefreshedTable(sender: UIRefreshControl) {
        pullToRefresh(UserController.shareController.currentUser)
    }
    
    
    
    func loadTimeLineForUser(user: User) {
        PostController.fetchTimeLineForUser(user) { (post) -> Void in
            if let post = post {
                self.posts = post
            }
        }
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("postsCell", forIndexPath: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
        cell.updateWithPost(post)
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
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPostDetail" {
            if let postDetailDestination = segue.destinationViewController as? PostDetailTableViewController {
                
                let _ = postDetailDestination.view
                
                if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPathForCell(cell) {
                    let post = posts[indexPath.row]
                    postDetailDestination.post = post
                }
            }
        }
    }
}