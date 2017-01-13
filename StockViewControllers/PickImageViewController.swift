//
//  PickImageViewController.swift
//  StockViewControllers
//
//  Created by Andrey Rudenko on 12/01/2017.
//  Copyright © 2017 premiumapp. All rights reserved.
//

import UIKit

class PickImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var ivPickedPhoto: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var tfTop: UITextField!
    @IBOutlet weak var tfBottom: UITextField!
    
    let memeTextAttirbutes: [String: Any] = [
        NSStrokeColorAttributeName: UIColor.black,
        NSForegroundColorAttributeName: UIColor.white,
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName: 3.0,

    ]
    
    let textFieldDelegate = DelegateMemeTf()

    override func viewDidLoad() {
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        tfTop.delegate = textFieldDelegate
        tfBottom.delegate = textFieldDelegate
        
        tfTop.defaultTextAttributes = memeTextAttirbutes
        tfBottom.defaultTextAttributes = memeTextAttirbutes
        
        tfTop.backgroundColor = UIColor.clear
        tfBottom.backgroundColor = UIColor.clear
    }
    
    func unsubscribeFromKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self,
            selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self,
            selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    func keyboardWillShow(_ notification:Notification) {
        
        if tfBottom.isFirstResponder {
            view.frame.origin.y -= getKeyboardHeight(notification)
        }
    }
    
    func keyboardWillHide(_ notification:Notification) {
        
        if tfBottom.isFirstResponder {
            view.frame.origin.y += getKeyboardHeight(notification)
        }
    }

    
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }

    @IBAction func pickPhotoFromLibrary(_ sender: UIBarButtonItem) {
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        
        present(imagePickerController,
                animated: true,
                completion: nil)
    }
    
    @IBAction func takePhoto(_ sender: UIBarButtonItem) {
        
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .camera
        
        present(imagePickerController,
                animated: true,
                completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            ivPickedPhoto.image = image
        }
    }
}
