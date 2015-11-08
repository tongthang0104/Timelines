//
//  PostController.swift
//  Timelines
//
//  Created by Thang H Tong on 11/4/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    
    
    static func fetchTimeLineForUser(user: User, completion: (post: [Post]?) -> Void) {
        completion(post: mockPost())
        
    }
    
    static func addPost(image: UIImage, caption: String?, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPost().first)
    }
    
    static func postFromIdentifier(identifier: String, completion: (post: Post?) -> Void) {
        completion(post: mockPost().first)
    }
    
    static func postForUser(user: User, completion: (post: [Post]?) -> Void) {
        completion(post: mockPost())
    }
    
    static func deletePost(post: Post) {
        
    }
    
    static func addCommentWithTextToPost (text: String, post: Post, completion: (success: Bool, post: Post?) -> Void?) {
        completion(success: true, post: mockPost().first)
    }
    
    static func deleteComment (comment: String, completion: (success: Bool, post: Post?) -> Void?) {
        completion(success: true, post: mockPost().first)
        
    }
    
    static func addLikePost(post: Post, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPost().first)
    }
    
    static func deleteLike (like: String, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPost().first)
    }
    
    static func orderPosts(post: [Post]) -> [Post] {
        return []
    }
    
    
    
    static func mockPost() -> [Post] {
        
        let  sampleImageID = "-K1l4125TYvKMc7rcp5e"
        
        let like1 = Like(username: "oeoe", postIdentifier: "1235")
        let like2 = Like(username: "superman", postIdentifier: "3233")
        let like3 = Like(username: "batman", postIdentifier: "92831")
        
        let comment1 = Comment(username: "superman", text: "I am superman", identifier: "3233", postIdentifier: "2313")
        let comment2 = Comment(username: "catwoman", text: "none", postIdentifier: "2132")
        
        let post1 = Post(imageEndPoint: sampleImageID, caption: "nice", username: "Hulk", comments: [comment1], likes: [like1], identifier: "213455")

        let post2 = Post(imageEndPoint: sampleImageID, caption: "Yo man", username: "superman", comments: [comment1, comment2] , likes: [like2, like3], identifier: "123414")
        let post3 = Post(imageEndPoint: sampleImageID, identifier: "9999")
        
        return [post1, post2, post3]
    }
    
}
