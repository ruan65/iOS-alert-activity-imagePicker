//
//  RochamboViewController.swift
//  StockViewControllers
//
//  Created by Andrey Rudenko on 10/01/2017.
//  Copyright © 2017 premiumapp. All rights reserved.
//

import UIKit

class RochamboViewController: UIViewController {
    
    enum RoshamboMove: String {
        case rock, paper, scissors
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func play(_ sender: UIButton) {
        
        let resultController: GameResultViewController
        
        resultController = storyboard?.instantiateViewController(withIdentifier: "gameResult")
            as! GameResultViewController
        
        
        let gameResult = getGameResult(sender.restorationIdentifier!)
        
        resultController.result = gameResult.0

        resultController.yourMove = gameResult.1
        
        resultController.appMove = gameResult.2
        
        present(resultController, animated: true, completion: nil)
    }
    
    func getGameResult(_ btnId: String) -> (String, String, String) {
        
        var playerMove: RoshamboMove
        
        switch btnId {
            
        case "rock":
            playerMove = .rock
        case "paper":
            playerMove = .paper
        default:
            playerMove = .scissors
        }
        let app = appMove()
        
        return (gameResult(playerMove: playerMove, appMove: app), playerMove.rawValue, app.rawValue)
    }
    
    func appMove() -> RoshamboMove {
        
        let random = arc4random() % 3
        
        switch random {
            
        case 0:
            return .rock
        case 1:
            return .paper
        default:
            return .scissors
        }
    }
    
    func gameResult(playerMove: RoshamboMove, appMove: RoshamboMove) -> String {
        
        let youWin = "YOU WIN!!!\n\n🏆 👏\n\n"
        let appWin = "The App has Won...\n\n🖕 🤡\n\n"
        
        switch (playerMove, appMove) {
            
        case (.rock, .paper), (.paper, .rock):            
            return (playerMove == .paper ? youWin : appWin) + "Paper covers Rock."
            
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
            return "It's a tie!\n\n😻"
            
        case (.rock, .scissors), (.scissors, .rock):
            return (playerMove == .rock ? youWin : appWin) + "Rock crushes Scissors."
            
        case (.paper, .scissors), (.scissors, .paper):
            return (playerMove == .scissors ? youWin : appWin) + "Scissors cut Paper."
        }
    }
}
