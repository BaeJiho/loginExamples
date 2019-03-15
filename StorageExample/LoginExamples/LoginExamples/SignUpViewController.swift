//
//  SignUpViewController.swift
//  LoginExamples
//
//  Created by 배지호 on 12/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func signUpAction(_ sender: UIButton) {
        
        guard let email = email.text, email != "", let password = password.text, password != "" else {
            AlertController.showAlertController(self, title: "error", message: "fill")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if result != nil {
                self.dismiss(animated: true, completion: nil)
            }
            if error != nil {
                AlertController.showAlertController(self, title: "error", message: "\(error?.localizedDescription)")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
