//
//  TextFieldsViewController.swift
//  StockViewControllers
//
//  Created by Andrey Rudenko on 11/01/2017.
//  Copyright © 2017 premiumapp. All rights reserved.
//

import UIKit

class TextFieldsViewController: UIViewController {
    
    @IBOutlet weak var randomTextColor: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    
    let firstDelegate = TextFieldFirstDelegate()
    let secondDelegate = TextFieldSecondDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        randomTextColor.delegate = firstDelegate
        secondTextField.delegate = secondDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
