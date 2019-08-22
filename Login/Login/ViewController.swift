//
//  ViewController.swift
//  Login
//
//  Created by Kohei Asai on 8/22/19.
//  Copyright © 2019 Kohei Asai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotUsernameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier, sender) {
        case ("ForgottenUserNameOrPassword", forgotUsernameButton as UIButton):
            segue.destination.navigationItem.title = "Forgot Username"
            break
        case ("ForgottenUserNameOrPassword", forgotPasswordButton as UIButton):
            segue.destination.navigationItem.title = "Forgot Password"
            break
        case (_, _):
            segue.destination.navigationItem.title = usernameTextField.text
        }
    }

    @IBAction func onForgotUsernameButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ForgottenUserNameOrPassword", sender: forgotUsernameButton)
    }
    
    @IBAction func onForgotPasswordButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "ForgottenUserNameOrPassword", sender: forgotPasswordButton)
    }
}

