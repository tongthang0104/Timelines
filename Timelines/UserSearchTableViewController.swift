//
//  UserSearchTableViewController.swift
//  Timelines
//
//  Created by Thang H Tong on 11/3/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import UIKit

class UserSearchTableViewController: UITableViewController, UISearchResultsUpdating {

    //MARK: Properties
    
    var userDataSource: [User] = []
    
    @IBOutlet weak var modeSegmentControl: UISegmentedControl!
    
    // Create Enum Viewmode
    enum ViewMode: Int {
        case Friends = 0
        case All = 1
        
        //TODO: -Not understand why has to call function in Enum
        func users(completion: (users: [User]?) -> Void) {
            
            switch self {
                
            case .Friends:
                
        //TODO: -Why it has to be changed to followers ? and why use the followByUser but not follow User
                UserController.followByUser(UserController.shareController.currentUser, completion: { (followers) -> Void in
                    completion(users: followers)
                })
            case .All:
                UserController.fetchAllUsers({ (users) -> Void in
                    completion(users: users)
                })
            }
        }
    }
    
    // Get computed Property mode
    var mode: ViewMode {
        get {
            return ViewMode(rawValue: modeSegmentControl.selectedSegmentIndex)!
        }
    }
    
   
    func updateViewBasedOnMode() {
        
        mode.users { (users) -> Void in
            if let users = users {
                self.userDataSource = users
            } else {
                self.userDataSource = []
            }
        }
        self.tableView.reloadData()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViewBasedOnMode()
        setUpSearchController()
    }
    

    //MARK: Changing Value Segment Action
    
    @IBAction func selectedIndexChanged(sender: UISegmentedControl) {
        
        updateViewBasedOnMode()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userDataSource.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("usersCell", forIndexPath: indexPath)

        let users = userDataSource[indexPath.row]
        
        cell.textLabel?.text =  users.username

        return cell
    }
    
    //MARK: SearchController
    
    var searchController: UISearchController!
    //Set up search Controller func
    
    func setUpSearchController() {
        
        //create var and assign to UIStoryboard(.....) then instantiateView Controller
        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("searchResultController")
        
        searchController = UISearchController(searchResultsController: resultsController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
        definesPresentationContext = true
    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchTerm = searchController.searchBar.text!.lowercaseString
        let resultsController = searchController.searchResultsController as? UserSearchResultsTableViewController
        
        if let resultsController = resultsController {
            resultsController.usersResultsDataSource = userDataSource.filter({$0.username.lowercaseString.containsString(searchTerm)})
            resultsController.tableView.reloadData()
            
        }
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
