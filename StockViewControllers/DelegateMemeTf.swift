
//
//  DelegateMemeTf.swift
//  StockViewControllers
//
//  Created by Andrey Rudenko on 12/01/2017.
//  Copyright © 2017 premiumapp. All rights reserved.
//

import Foundation
import UIKit

class DelegateMemeTf: NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


