//
//  HomeViewController.swift
//  LoginExamples
//
//  Created by 배지호 on 14/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(true, forKey: "register")
        UserDefaults.standard.synchronize()
    }
    

}
