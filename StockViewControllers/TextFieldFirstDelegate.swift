//
//  TextFieldFirstDelegate.swift
//  StockViewControllers
//
//  Created by Andrey Rudenko on 11/01/2017.
//  Copyright © 2017 premiumapp. All rights reserved.
//

import Foundation
import UIKit

class TextFieldFirstDelegate: NSObject, UITextFieldDelegate {
    
    let colors: [UIColor] = [.red, .green, .blue, .gray, .black, .yellow, .purple, .orange, .brown,
                           .magenta, .green, .cyan]
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        textField.textColor = randomColor()
        
        return true
    }
    
    func randomColor() -> UIColor {
        return colors[Int(arc4random() % UInt32(colors.count))]
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        print("textFieldDidBeginEditing..........")
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
        
        return true
    }
}
