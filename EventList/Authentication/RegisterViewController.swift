//
//  RegisterViewController.swift
//  EventList
//
//  Created by Titas Dutta on 1/28/21.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSignupBtnClick(_ sender: Any) {
        
        let username: String = usernameTextField.text!
        let email: String = emailTextField.text!
        let password: String = passwordTextField.text!
        
        let user = User(username: username, email: email, password: password)
        APIManager.sharedInstance.callSignupAPI(user: user) {
            (isSuccessful) in
            if isSuccessful  {
                
            } else {
                
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
