//
//  PickImageViewController.swift
//  StockViewControllers
//
//  Created by Andrey Rudenko on 12/01/2017.
//  Copyright © 2017 premiumapp. All rights reserved.
//

import UIKit

class PickImageViewController: UIViewController {

    @IBOutlet weak var ivPickedPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func pickPhotoFromLibrary(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        
        present(imagePickerController,
                animated: true,
                completion: nil)

    }
}
