//
//  Post.swift
//  Timelines
//
//  Created by Thang H Tong on 11/3/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import Foundation

struct Post: Equatable {
    
    //Create Properties (image, caption, username, comments, likes, identifier)
    var imageEndPoint: String
    var caption: String?
    var username: String
    var comments: [String]
    var likes: [String]
    var identifier: String?
    
    init(imageEndPoint: String, caption: String? = nil, username: String, comments: [String] = [], likes: [String] = [], identifier: String) {
        
        self.imageEndPoint = imageEndPoint
        self.caption = caption
        self.username = username
        self.comments = comments
        self.likes = likes
        self.identifier = identifier
    }
}

func ==(lhs: Post, rhs: Post) -> Bool{
    return (lhs.username == rhs.username) && (lhs.identifier == rhs.identifier)
}

