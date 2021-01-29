//
//  RegisterViewController.swift
//  EventList
//
//  Created by Titas Dutta on 1/28/21.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSignupBtnClick(_ sender: Any) {
        let user = User(username: "titas", email: "titas@gmail.com", password: "abcd@1233")
        
        APIManager.sharedInstance.callSignupAPI(user: user)
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
