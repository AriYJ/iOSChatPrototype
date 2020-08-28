//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Ari Jane on 5/14/20.
//  Copyright © 2020 Ari Jane. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTextfield.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {  //adding this so that when we press return it's the same as pressing loginPressed button
        textField.resignFirstResponder()  //dismiss keyboard
        logIn()
        return true
    }



    @IBAction func loginPressed(_ sender: UIButton) {
        logIn()
    }
    
    func logIn() {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              guard let self = self else { return }
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
    
}
