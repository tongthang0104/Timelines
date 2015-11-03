//
//  Comment.swift
//  Timelines
//
//  Created by Thang H Tong on 11/3/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import Foundation

struct Comment {
    
    //Properties
    
    var username: String
    var text: String
    var identifier: String?
    var postIdentifier: String
    
    init(username: String, text: String, identifier: String? = nil, postIdentifier: String) {
        
        self.username = username
        self.identifier = identifier
        self.text = text
        self.postIdentifier = postIdentifier
    }
    
}


//Create func Equatable
func ==(lhs: Comment, rhs: Comment) -> Bool{
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}