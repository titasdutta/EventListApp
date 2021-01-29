//
//  SignupViewController.swift
//  EventList
//
//  Created by Titas Dutta on 1/28/21.
//

import UIKit

class SignupViewController: UIViewController {
    
    // MARK: - Define View Items
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var signinLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // MARK: - Styling for View Items
        // Rounded Buttons
        signupBtn.layer.cornerRadius = 3
    }

    

}

