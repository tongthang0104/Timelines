//
//  Like.swift
//  Timelines
//
//  Created by Thang H Tong on 11/3/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import Foundation

struct Like: Equatable {
    
    //Properties
    var username: String
    var postIdentifier: String
    var identifier: String?
    
    init(username: String, postIdentifier: String, identifier: String? = nil) {
        
        self.username = username
        self.postIdentifier = postIdentifier
        self.identifier = identifier
    }
}

//Create func Equatable
func ==(lhs: Like, rhs: Like) -> Bool{
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}
