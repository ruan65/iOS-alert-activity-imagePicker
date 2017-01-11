//
//  GameResultViewController.swift
//  StockViewControllers
//
//  Created by Andrey Rudenko on 10/01/2017.
//  Copyright © 2017 premiumapp. All rights reserved.
//

import UIKit

class GameResultViewController: UIViewController {
    
    var result: String = ""
    var yourMove: String = ""
    var appMove: String = ""
    
    @IBOutlet weak var displayResult: UILabel!
    @IBOutlet weak var appMoveImage: UIImageView!
    @IBOutlet weak var yourMoveImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(result)

        displayResult.text = result
        
        appMoveImage.image = UIImage(named: appMove)
        yourMoveImg.image = UIImage(named: yourMove)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
