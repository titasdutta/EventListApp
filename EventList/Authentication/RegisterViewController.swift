//
//  RegisterViewController.swift
//  EventList
//
//  Created by Titas Dutta on 1/28/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - Signup TextFields
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Sign Up
    @IBAction func onSignupBtnClick(_ sender: Any) {
        
        let username: String = usernameTextField.text!
        let email: String = emailTextField.text!
        let password: String = passwordTextField.text!
        
        let user = User(username: username, password: password)
        APIManager.sharedInstance.callSignupAPI(user: user) {
            (isSuccessful) in
            if isSuccessful  {
                // Go to Event list screen
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "signup_success", sender: self)
                }
                
            } else {
                // Stay on this screen and show error message
                let alert = UIAlertController(title: "Oops ...", message: "Something Went Wrong!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    

}
