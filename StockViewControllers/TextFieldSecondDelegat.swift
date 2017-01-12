//
//  TextFieldFirstDelegate.swift
//  StockViewControllers
//
//  Created by Andrey Rudenko on 11/01/2017.
//  Copyright © 2017 premiumapp. All rights reserved.
//

import Foundation
import UIKit

class TextFieldSecondDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return textField.text == "ok" ? false : true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        print("textFieldDidBeginEditing..........")
        
        textField.text = ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing............")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        print("TextFieldShouldClear.........")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("TextFieldShouldReturn.........")
        
        textField.resignFirstResponder()
        return true
    }
}
