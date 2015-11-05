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
    static func userForIdentifier(identifier: String, completion: (user: User?) -> Void) {
        
        completion(user: mockUser().first)
        
    }
    
    //Getting and Reading all of the users
    static func fetchAllUsers(completion: (user: [User]) -> Void) {
        
        completion(user: mockUser())
    }
    
    //Follow User or not?
    static func followUser(user: User, completion: (success: Bool) -> Void) {
        completion(success: true)
    }
    
    //one user follow another
    static func userFollowsUser (user: User, followUser: String , completion: (follow: Bool) -> Void) {
        completion(follow: true)
    }
    //Check if the others follow?
    static func followByUser(user: User, completion: (follows: [User]?) -> Void) {
        
        completion(follows: mockUser())
    }
    
    //Authenticate user id and password?
    static func authenticateUser(email: String, password: String, completion: (success: Bool, user: User?) -> Void) {
        completion(success: true, user: mockUser().first)
    }
    
    //Create new User
    static func createUser(email: String, password: String, bio: String?, url: String, completion: (success: Bool, user: User?) -> Void) {
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