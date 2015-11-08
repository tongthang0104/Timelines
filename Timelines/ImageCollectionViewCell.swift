//
//  ImageCollectionViewCell.swift
//  Timelines
//
//  Created by Thang H Tong on 11/7/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func updateWithImageIdentifier(identifier: String) {
        
        self.imageView.image = nil
        
        ImageController.imageForIdentifier(identifier) { (image) -> Void in
            guard let _ = image else {return}
                self.imageView.image = image
        }
    }
}
