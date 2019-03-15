//
//  HomeViewController.swift
//  LoginExamples
//
//  Created by 배지호 on 14/03/2019.
//  Copyright © 2019 baejiho. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class HomeViewController: UIViewController {

//    let storage = Storage.storage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(true, forKey: "register")
        UserDefaults.standard.synchronize()
    }
    @IBAction func upload(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
}
//firebase Storage Image upload
extension HomeViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let storage = Storage.storage()
        
//        let image = UIImage.pngData(info[UIImagePickerController.InfoKey.originalImage] as! UIImage)
//        let image = info[UIImagePickerController.InfoKey.imageURL] as! URL
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        let data = image.pngData()
        guard let data2 = data else {return}
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let imageName = uid + "\(Int(NSDate.timeIntervalSinceReferenceDate * 1000)).jpg"
        let imageRef = storage.reference().child("upload_iOS").child(imageName)
        
        imageRef.putData(data2, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {return}
            // Metadata contains file metadata such as size, content-type.
            let size = metadata.size
            // You can also access to download URL after upload.
            imageRef.downloadURL { (url, error) in
                guard let downloadURL = url else {return}
                print("downloadURL : \(downloadURL.absoluteString)")
                
            }
        }
//        storage.reference().downloadURL { (url, error) in
//            print("url : \()")
//        }
        dismiss(animated: true, completion: nil)
    }
}

extension HomeViewController: UINavigationControllerDelegate {
    
}
