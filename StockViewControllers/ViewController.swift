//
//  ViewController.swift
//  StockViewControllers
//
//  Created by Andrey Rudenko on 09/01/2017.
//  Copyright © 2017 premiumapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func openImagePicker(_ sender: UIButton) {
        
        let imagePickerController = UIImagePickerController()
        
        present(imagePickerController,
                animated: true,
                completion: nil)
    }
    
    @IBAction func showActivity(_ sender: UIButton) {
        
        let image = UIImage()
        
        let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        
        present(activityController,
                animated: true) {
                    
        }
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        
        let alertController = UIAlertController()
        
        alertController.title = "Hi there!"
        alertController.message = "Time to work. Enough hollidays....."
        
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) {
                action in self.dismiss(animated: true, completion: nil)
            })
        
        present(alertController, animated: true, completion: nil)
    }
}

