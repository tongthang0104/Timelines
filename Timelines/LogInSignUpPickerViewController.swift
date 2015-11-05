//
//  LogInSignUpPickerViewController.swift
//  Timelines
//
//  Created by Thang H Tong on 11/3/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import UIKit

class LogInSignUpPickerViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "signUpSegue" {
            if let signUpDisplay = segue.destinationViewController as? LoginSignUpViewController {
                _ = signUpDisplay.view
                
                signUpDisplay.updateWithSignUpMode()
            }
        } else if segue.identifier == "loginSegue" {
            if let loginDisplay = segue.destinationViewController as? LoginSignUpViewController {
                _ = loginDisplay.view
                
                loginDisplay.updateWithLoginMode()
            }
        }
        
        
    }
  

}
