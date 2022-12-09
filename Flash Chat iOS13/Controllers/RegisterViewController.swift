//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print(e)
                    // Create a new alert
                    
                    let localizedMessage = e.localizedDescription
                    var dialogMessage = UIAlertController(title: "Attention", message: localizedMessage, preferredStyle: .alert)

                    let ok = UIAlertAction(title: "OK", style: .default)
                    dialogMessage.addAction(ok)
                    // Present alert to user
                    self.present(dialogMessage, animated: true, completion: nil)
                }else{
                    self.performSegue(withIdentifier: "RegisterToChat", sender: self)
                }
            }
        }
    }
    
    
}
