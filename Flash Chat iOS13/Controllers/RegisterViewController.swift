//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Ari Jane on 5/14/20.
//  Copyright © 2020 Ari Jane. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)  //in real app, we need to relay the info to user by e.g. creating a popup
                } else {
                    // Navigate to chat view controller
                    self.performSegue(withIdentifier: K.registerSegue, sender: self) //sender is origin of segue
                }
            }
        }
        
    }
    
}
