//
//  PostTableViewCell.swift
//  Timelines
//
//  Created by Thang H Tong on 11/8/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var likesLabel: UILabel!
    
    @IBOutlet weak var commentsLabel: UILabel!
    
    func updateWithPost(post: Post) {
        
        self.postImageView.image = nil
        self.likesLabel.text = "\(post.likes.count) likes"
        self.commentsLabel.text = "\(post.comments.count) comments"
       
        ImageController.imageForIdentifier(post.imageEndPoint) { (image) -> Void in
           
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.postImageView.image = image
            })
            
        }
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
