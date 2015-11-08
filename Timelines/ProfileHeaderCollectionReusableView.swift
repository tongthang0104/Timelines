//
//  ProfileHeaderCollectionReusableView.swift
//  Timelines
//
//  Created by Thang H Tong on 11/7/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import UIKit

class ProfileHeaderCollectionReusableView: UICollectionReusableView {
    
    
    var delegate: ProfileHeaderCollectionReusableViewDelegate?
    
    
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var urlButton: UIButton!
    @IBOutlet weak var followUserButton: UIButton!
    
    @IBAction func urlButtonTapped(sender: UIButton) {
        self.delegate?.userTappedURLActionButton(sender)
    }
    
    @IBAction func followUserButtonTapped(sender: UIButton) {
        self.delegate?.userTappedFollowActionButton(sender)
    }
    
    func updateWithUser(user: User) {
        
        if let bio = user.bio {
            bioLabel.text = bio
        }else {
            //TODO: why bioLabel is not Nil?
            if bioLabel != nil {
                bioLabel.removeFromSuperview()
            }
        }
        
        if let url = user.url {
            urlButton.setTitle(url, forState: .Normal)
        }else {
            if urlButton != nil {
                urlButton.removeFromSuperview()
            }
        }
        
        //check current user
        if user == UserController.shareController.currentUser {
            followUserButton.setTitle("You", forState: .Normal)
            followUserButton.enabled = false
        }else {
            UserController.userFollowsUser(UserController.shareController.currentUser, followUser: user, completion: { (follow) -> Void in
                if follow {
                    self.followUserButton.enabled = true
                    self.followUserButton.setTitle("Unfollow", forState: .Normal)
                } else {
                    self.followUserButton.setTitle("Follow", forState: .Normal)
                }
            })
        }
    }
}

//TODO: Ask why I have to create a protocol
protocol ProfileHeaderCollectionReusableViewDelegate {
    
    func userTappedFollowActionButton(sender: UIButton)
    func userTappedURLActionButton(sender: UIButton)
}