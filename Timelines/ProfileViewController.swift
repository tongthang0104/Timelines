//
//  ProfileViewController.swift
//  Timelines
//
//  Created by Thang H Tong on 11/3/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource {
    
    var users: User?
    
    

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(users)
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("imageCollectionCell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.redColor()
        return cell
        
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

