//
//  User.swift
//  Timelines
//
//  Created by Thang H Tong on 11/3/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import Foundation

struct User: Equatable {
    
    //Properties
    var username: String
    var bio: String?
    var url: String?
    var identifier: String?
    
    //Initialize
    init(username: String, bio: String? = nil, url: String? = nil, identifier: String? = nil) {
        
        self.username = username
        self.bio = bio
        self.identifier = identifier
        self.url = url
    }
    
}


//Create func Equatable
func ==(lhs: User, rhs: User) -> Bool{
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}

