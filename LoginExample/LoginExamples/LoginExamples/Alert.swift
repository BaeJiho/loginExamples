//
//  Alert.swift
//  LoginExamples
//
//  Created by 배지호 on 12/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit

class AlertController {
    static func showAlertController(_ UIViewController: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        UIViewController.present(alert, animated: true, completion: nil)
    }
}
