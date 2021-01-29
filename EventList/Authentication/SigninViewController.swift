//
//  SigninViewController.swift
//  EventList
//
//  Created by Titas Dutta on 1/29/21.
//

import UIKit

class SigninViewController: UIViewController {

    // MARK: - TextFields
    @IBOutlet weak var signinUsernameTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var signinPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Sign In
    @IBAction func onSigninBtnClick(_ sender: Any) {
        let username: String = signinUsernameTextField.text!
        let password: String = signinPasswordTextField.text!
        
        let user = User(username: username, password: password)
            
        APIManager.sharedInstance.login(user: user) {
            (result) in
            switch result{
            case .success(let json):
                print(json as AnyObject)
            case .failure(let error):
                print(error.localizedDescription )
            }
        }
    }
}
