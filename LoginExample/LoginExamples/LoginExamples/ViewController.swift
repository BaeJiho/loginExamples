//
//  ViewController.swift
//  LoginExamples
//
//  Created by 배지호 on 12/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    
    @IBAction func signIn(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        guard let email = email.text, email != "", let password = password.text, password != "" else {
            AlertController.showAlertController(self, title: "Error", message: "Please Check your email")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if result != nil {
                guard let user = result else {return}
                AlertController.showAlertController(self, title: "info", message: "succes")
            }
            if error != nil {
                AlertController.showAlertController(self, title: "error", message: error!.localizedDescription)
            }
        }
    }
    

}

