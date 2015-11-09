//
//  ProfileViewController.swift
//  Timelines
//
//  Created by Thang H Tong on 11/3/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import UIKit
import SafariServices

class ProfileViewController: UIViewController, UICollectionViewDataSource, ProfileHeaderCollectionReusableViewDelegate {
    
    //MARK: Properties
    var users: User!
    var userPosts: [Post] = []
    let currentUser = UserController.shareController.currentUser
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var editBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if users == nil {
            users = currentUser
            editBarButton.enabled = true
        }
        updateBasedOnUser()
    }
    
    
    func logoutUser() {
        
    }
   
    //update Post bases on User
    func updateBasedOnUser() {
        
        guard let user = users else {return}
     
        self.title = users.username
        
        PostController.fetchTimeLineForUser(user) { (post) -> Void in
            if let post = post {
                self.userPosts = post
            } else {
                self.userPosts = []
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.collectionView.reloadData()
            })
        }
    }
    
   //MARK: -CollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userPosts.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCellWithReuseIdentifier("imageCollectionCell", forIndexPath: indexPath) as! ImageCollectionViewCell
        
        let post = userPosts[indexPath.item]
        item.updateWithImageIdentifier(post.imageEndPoint)
        return item
    }
    
    //TODO: -what is viewForSupplementaryElementOfKind
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "profileHeaderCell", forIndexPath: indexPath) as! ProfileHeaderCollectionReusableView
        headerView.delegate = self
        if let user = users {
            headerView.updateWithUser(user)
        }
        return headerView
    }
    
    //MARK: -ProfileHeaderColletionReusableViewDelegate
    
    func userTappedURLActionButton(sender: UIButton) {
        let safariVC = SFSafariViewController(URL: NSURL(string: users.url!)!)
        presentViewController(safariVC, animated: true, completion: nil)
    }
    
    func userTappedFollowActionButton(sender: UIButton) {

        guard let user = users else {return}
        
        if user == currentUser {
            UserController.logoutCurrentUser()
            tabBarController?.selectedViewController = tabBarController?.viewControllers![0]
        } else {
            UserController.userFollowsUser(UserController.shareController.currentUser, followUser: users) { (follow) -> Void in
                if follow {
                    UserController.unfollowUser(self.users!, completion: { (success) -> Void in
                        self.updateBasedOnUser()
                    })
                } else {
                    UserController.followUser(self.users!, completion: { (success) -> Void in
                        self.updateBasedOnUser()
                    })
                }
            }
        }
    }
    
    //MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toEditProfile" {
            if let editDestinationView = segue.destinationViewController as? LoginSignUpViewController {
                _ = editDestinationView.view
                editDestinationView.updateWithUser(users)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

