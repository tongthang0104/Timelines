//
//  LoginSignUpViewController.swift
//  Timelines
//
//  Created by Thang H Tong on 11/3/15.
//  Copyright © 2015 Thang. All rights reserved.
//

import UIKit

class LoginSignUpViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    
    //Enum Login, Signup
    enum ViewMode {
        case Login, Signup
    }
    
    var mode: ViewMode = .Signup
    var fieldsAreValid: Bool {
        get {
            switch mode {
            case .Login:
                return !(emailTextField.text!.isEmpty && passwordTextField.text!.isEmpty)
                
            case .Signup:
                return !(emailTextField.text!.isEmpty && passwordTextField.text!.isEmpty && emailTextField.text!.isEmpty)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViewBasedOnMode()
    }
    
    //MARK: Action
    
    @IBAction func actionButtonTapped(sender: UIButton) {
        
        if fieldsAreValid {
            switch mode {
            case .Login:
                UserController.authenticateUser(emailTextField.text!, password: passwordTextField.text!, completion: { (success, user) -> Void in
                    if success, let _ = user {
                        self.dismissViewControllerAnimated(true, completion: nil)
                    } else {
                        self.presentValidationAlertWithTitle("Unable to verify your accout", message: "Please check your username or password")
                    }
                })
            case .Signup:
                UserController.createUser(emailTextField.text!, password: passwordTextField.text!, bio: bioTextField.text, url: urlTextField.text, completion: { (success, user) -> Void in
                    if success, let _ = user {
                        self.dismissViewControllerAnimated(true, completion: nil)
                    } else {
                        self.presentValidationAlertWithTitle("Unable to Signup", message: "Please check your information and try again")
                    }
                })
            }
        }
    }
    
    //Alert
    
    func presentValidationAlertWithTitle(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    //update base on the mode
    func updateViewBasedOnMode() {
        switch mode {
        case .Login:
            return updateWithLoginMode()
        default:
            return updateWithSignUpMode()
        }
    }
    
    //Login mode
    func updateWithLoginMode() {
        emailTextField.hidden = true
        bioTextField.hidden = true
        urlTextField.hidden = true
        passwordTextField.hidden = false
        usernameTextField.hidden = false
        actionButton.setTitle("Login", forState: .Normal)
    }
    
    //Sign Up mode
    func updateWithSignUpMode() {
        actionButton.setTitle("SignUp", forState: .Normal)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
