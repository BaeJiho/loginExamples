//
//  LogOutViewController.swift
//  LoginExamples
//
//  Created by 배지호 on 14/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit
import Firebase

class LogOutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Logout(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print(error.localizedDescription)
        }
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        guard let window = UIApplication.shared.keyWindow else {return}
        window.rootViewController = vc
    }
}
