//
//  UserController.swift
//  Timelines
//
//  Created by Thang H Tong on 11/3/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import Foundation

class UserController {
    
    static let shareController = UserController()
    
    
    var currentUser: User! = UserController.mockUser().first
    
    
    //Check user Identifier
    static func userForIdentifier(identifier: String, completion: (users: User?) -> Void) {
        
        completion(users: mockUser().first)
        
    }
    
    //Getting and Reading all of the users
    static func fetchAllUsers(completion: (users: [User]) -> Void) {
        
        completion(users: mockUser())
    }
    
    //Follow User or not?
    static func followUser(user: User, completion: (success: Bool) -> Void) {
        completion(success: true)
    }
    
    //unfollow User
    static func unfollowUser(user: User, completion: (success: Bool) -> Void) {
        completion(success: true)
    }
    
  
    //one user follow another
    static func userFollowsUser (users: User, followUser: User, completion: (follow: Bool) -> Void) {
        completion(follow: true)
    }
    //Check if the others follow?
    static func followByUser(users: User, completion: (followed: [User]?) -> Void) {
        
        completion(followed: [mockUser()[1], mockUser()[0]])
    }
    
    //Authenticate user id and password?
    static func authenticateUser(email: String, password: String, completion: (success: Bool, user: User?) -> Void) {
        completion(success: true, user: mockUser().first)
    }
    
    //Create new User
    static func createUser(email: String, password: String, bio: String?, url: String?, completion: (success: Bool, user: User?) -> Void) {
        completion(success: true, user: mockUser().first)
    }
    
    //Update User
    static func updateUser(user: String, username: String, bio: String?, url: String?, completetion: (success: Bool, user: User?) -> Void) {
        
        completetion (success: true, user: mockUser().first)
    }
    
    //Logout
    static func logoutCurrentUser() {
        
    }
    
    static func mockUser() -> [User] {
        
        let user1 = User(username: "thangtong", bio: "student", url: "thangtong.com", identifier: "1234")
        let user2 = User(username: "pauladam", bio: "a man", identifier: "2345")
        let user3 = User(username: "Bill")
        let user4 = User(username: "Gate", url: "billGate.com", identifier: "3456")
        
        return [user1, user2, user3, user4]
    }
}