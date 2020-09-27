//
//  GameView.swift
//  Game
//
//  Created by Albert Ahmadiev on 27.09.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import UIKit

class GameView: UIView, ViewStyles {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    @IBOutlet var button7: UIButton!
    @IBOutlet var button8: UIButton!
    @IBOutlet var button9: UIButton!
    
    var buttons = [UIButton]()
    var element: String?
    
    func addButtons() {
        buttons.append(button1)
        buttons.append(button2)
        buttons.append(button3)
        buttons.append(button4)
        buttons.append(button5)
        buttons.append(button6)
        buttons.append(button7)
        buttons.append(button8)
        buttons.append(button9)
        
        for button in buttons{
            button.backgroundColor = .lightGray
        }
    }
    
    private var mainBoard = [-1,
                            0, 0, 0,
                            0, 0, 0,
                            0, 0, 0]
    
    @IBAction func buttonTap(_ sender: UIButton){
        if(mainBoard[sender.tag] == 0){
            mainBoard[sender.tag] = 1
            print(element ?? "Error")
            buttons[sender.tag-1].titleLabel?.text = element
            let bestMove = findBestMove()
            print(bestMove)
            buttons[findBestMove()+1].titleLabel?.text = element
            mainBoard[bestMove+2] = 2
        }
    }
    
    func minimax(_ board: [Int], minmax: Bool) -> Int {
        
        if isWin { return 1 }
        else if isWin{ return -1 }
        else if isDraw { return 0 }
     
        if minmax {
            var bestSituation = Int.min
            for i in 1...board.count-1 {
                if(board[i] == 0){
                    var newBoard = board
                    newBoard[i] = 2
                    let result = minimax(newBoard, minmax: false)
                    bestSituation = max(result, bestSituation)
                }
            }
            return bestSituation
        } else { // minimizing
            var worstSituation = Int.max
            for i in 1...board.count-1 {
                if(board[i] == 0){
                    var newBoard = board
                    newBoard[i] = 1
                    let result = minimax(newBoard, minmax: true)
                    worstSituation = min(result, worstSituation)
                }
            }
            return worstSituation
        }
    }
    
    func findBestMove() -> Int {
        var bestSituation = Int.min
        var bestMove = -1
        for i in 1...mainBoard.count-1 {
            if(mainBoard[i] == 0){
                var newBoard = mainBoard
                newBoard[i] = 2
                let result = minimax(newBoard, minmax: false)
                if result > bestSituation {
                    bestSituation = result
                    bestMove = i
                }
            }
        }
        return bestMove
    }
    
    var isWin: Bool {
           return
                mainBoard[1] != 0 && mainBoard[1] == mainBoard[2] && mainBoard[1] == mainBoard[3] ||
                mainBoard[4] != 0 && mainBoard[4] == mainBoard[5] && mainBoard[4] == mainBoard[6] ||
                mainBoard[7] != 0 && mainBoard[7] == mainBoard[8] && mainBoard[7] == mainBoard[9] ||
                mainBoard[1] != 0 && mainBoard[1] == mainBoard[4] && mainBoard[1] == mainBoard[7] ||
                mainBoard[2] != 0 && mainBoard[2] == mainBoard[5] && mainBoard[2] == mainBoard[8] ||
                mainBoard[3] != 0 && mainBoard[3] == mainBoard[6] && mainBoard[3] == mainBoard[9] ||
                mainBoard[1] != 0 && mainBoard[1] == mainBoard[5] && mainBoard[1] == mainBoard[9] ||
                mainBoard[3] != 0 && mainBoard[3] == mainBoard[5] && mainBoard[3] == mainBoard[7]
    
    }
    
    var isDraw: Bool{
        for position in mainBoard{
            if position == 0{
            return false
            }
        }
        return true
    }
    
    func startGameStyle() {
        self.layer.cornerRadius = 10
        self.backgroundColor = .lightGray
        self.isHidden = true
    }
    
    func gamingStyle() {
        self.isHidden = true
    }
    
    func resultStyle(playerWin: Bool) {
        switch playerWin {
        case true:
            self.backgroundColor = .green
        default:
            self.backgroundColor = .red
        }
    }
        
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
