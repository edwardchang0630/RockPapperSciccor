//
//  ViewController.swift
//  RockPApperSciccor
//
//  Created by Yuan-Che Chang on 2020/8/23.
//  Copyright © 2020 Yuan-Che Chang. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    var name1: String? = nil
    var name2: String? = nil
    let rps = ["paper", "rock", "scissors"]
    var gameRoundNum = 0
    var recordListInRps: [String] = []
    
    @IBOutlet weak var gameRoundLabel: UILabel!
    
    
    @IBOutlet weak var player1Name: UILabel!
    
    @IBOutlet weak var player2Name: UILabel!
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var player1Image: UIImageView!
    @IBOutlet weak var player2Image: UIImageView!
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        player1Name.text = name1
        player2Name.text = name2
        
        
        gameRoundNum += 1
        gameRoundLabel.text = "Game \(gameRoundNum)"
        
        
    }
    
    @IBAction func start(_ sender: UIButton) {
           //        player1Image.image = UIImage (named:"paper")
           //        player2Image.image = UIImage (named:"scissors")
           let player1Index = Int.random(in:0...2)
           let player2Index = Int.random(in:0...2)
           print(player1Index)
           print(player2Index)
           
           player1Image.image = UIImage (named:rps[player1Index])
           player2Image.image = UIImage (named:rps[player2Index])
           
           let checkWinner = (player1Index, player2Index)
           switch checkWinner {
           case let (x, y) where x == y:
               return winnerLabel.text = "平手"
           case (0, 1):
               return winnerLabel.text = "\(name1!)獲勝"
           case (0, 2):
               return winnerLabel.text = "\(name2!)獲勝"
           case (1, 0):
               return winnerLabel.text = "\(name2!)獲勝"
           case (1, 2):
               return winnerLabel.text = "\(name1!)獲勝"
           case (2, 0):
               return winnerLabel.text = "\(name1!)獲勝"
           case (2, 1):
               return winnerLabel.text = "\(name2!)獲勝"
           case (_, _): return
           }
           
       }
   
}


