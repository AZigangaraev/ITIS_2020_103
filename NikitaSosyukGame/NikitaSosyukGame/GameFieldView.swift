//
//  GameFieldView.swift
//  NikitaSosyukGame
//
//  Created by Nikita Sosyuk on 26.09.2020.
//  Copyright © 2020 Nikita Sosyuk. All rights reserved.
//

import UIKit

class GameFieldView: UIView {
    
    @IBOutlet private var backgroundImageView: UIImageView!
    @IBOutlet private var platformOne: UIButton!
    @IBOutlet private var platformTwo: UIButton!
    @IBOutlet private var platformThree: UIButton!
    @IBOutlet private var platformFour: UIButton!
    @IBOutlet private var platformFive: UIButton!
    @IBOutlet private var platformSix: UIButton!
    @IBOutlet private var platformSeven: UIButton!
    @IBOutlet private var platformEight: UIButton!
    @IBOutlet private var platformNine: UIButton!
    
    weak var statusView: StatusView?
    
    //    10 - крестик, 20 - нолик, 0 - пустота
    private var figure = 10
    private var figureAI = 20
    private var gameField: [[Int]] = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundImageView.image = #imageLiteral(resourceName: "PlayField")
        self.isHidden = true
        platformOne.setImage(nil, for: .normal)
        platformTwo.setImage(nil, for: .normal)
        platformThree.setImage(nil, for: .normal)
        platformFour.setImage(nil, for: .normal)
        platformFive.setImage(nil, for: .normal)
        platformSix.setImage(nil, for: .normal)
        platformSeven.setImage(nil, for: .normal)
        platformEight.setImage(nil, for: .normal)
        platformNine.setImage(nil, for: .normal)
    }
    
    func startGame(figureIndex: Int) {
        awakeFromNib()
        gameField = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
        self.isHidden = false
        if figureIndex == 20 {
            figureAI = 10
            figure = 20
        }
    }
    
    func makeMove(positionOne: Int, positionTwo: Int) {
        gameField[positionOne][positionTwo] = figure
        print(gameField)
        if checkWinner() == 0 {
            makeAIMove()
        }
        statusGame()
    }
    
    func statusGame() {
        let winner = checkWinner()
        print(winner)
        if winner != 0 {
            //костыль, чтобы нельзя было ходить
            gameField = [[10, 10, 10], [10, 10, 10], [10, 10, 10]]
            switch winner {
            case 10:
                statusView?.winX()
            case 20:
                statusView?.winO()
            case 100:
                statusView?.drawnGame()
            default:
                print("Error")
            }
        }
    }
    //    10 - победили крестики, 20 - победили нолики, 0 - есть поля, 100 - ничья
    func checkWinner() -> Int {
        var winner = 0
        
        for i in 0..<3 {
            if (gameField[i][0] == gameField[i][1] && gameField[i][1] == gameField[i][2] && gameField[i][0] != 0 && gameField[i][1] != 0 && gameField[i][2] != 0) {
                winner = gameField[i][0]
                
            }
        }
        
        for i in 0..<3 {
            if (gameField[0][i] == gameField[1][i] && gameField[0][i] == gameField[2][i] && gameField[0][i] != 0 && gameField[1][i] != 0 && gameField[2][i] != 0) {
                winner = gameField[0][i]
            }
        }
        if (gameField[0][0] == gameField[1][1] && gameField[0][0] == gameField[2][2] && gameField[2][2] != 0 && gameField[0][0] != 0 && gameField[1][1] != 0) {
            winner = gameField[0][0]
        }
        
        if (gameField[2][0] == gameField[1][1] && gameField[2][0] == gameField[0][2] && gameField[2][0] != 0 && gameField[1][1] != 0 && gameField[0][2] != 0) {
            winner = gameField[2][0]
        }
        
        var vacuity = 0
        for i in 0..<3 {
            for j in 0..<3 {
                if (gameField[i][j] == 0) {
                    vacuity += 1
                }
            }
        }
        
        if (winner == 0 && vacuity == 0) {
            return 100
        } else {
            return winner
        }
    }
    
    func makeAIMove() {
        var bestScore = Int.min
        var move: (positionOne: Int, positionTwo: Int) = (0, 0)
        for i in 0..<3 {
            for j in 0..<3 {
                if (gameField[i][j] == 0) {
                    gameField[i][j] = figureAI
                    let score = minimax(depth: 0, isMaximizing: false)
                    gameField[i][j] = 0
                    if (score > bestScore) {
                        bestScore = score
                        move = (i, j)
                    }
                }
            }
        }
        drawAIMove(position: move)
        gameField[move.positionOne][move.positionTwo] = figureAI
    }
    
    func minimax(depth: Int, isMaximizing: Bool) -> Int {
        let result = checkWinner()
        if (result != 0) {
            return result
        }
        
        if (isMaximizing) {
            var bestScore = Int.min
            for i in 0..<3 {
                for j in 0..<3 {
                    if (gameField[i][j] == 0) {
                        gameField[i][j] = figureAI
                        let score = minimax(depth: depth + 1, isMaximizing: false)
                        gameField[i][j] = 0
                        bestScore = max(score, bestScore)
                    }
                }
            }
            return bestScore
        } else {
            var bestScore = Int.max
            for i in 0..<3 {
                for j in 0..<3 {
                    if (gameField[i][j] == 0) {
                        gameField[i][j] = figure
                        let score = minimax(depth: depth + 1, isMaximizing: true)
                        gameField[i][j] = 0
                        bestScore = min(score, bestScore)
                    }
                }
            }
            return bestScore
        }
    }
    
    //    методы для нажатия на поля
    @IBAction func pressPlatformOne(_ sender: AnyObject) {
        if gameField[0][0] == 0 {
            drawFigure(button: platformOne, whichFigure: figure)
            makeMove(positionOne: 0, positionTwo: 0)
        }
    }
    
    @IBAction func pressPlatformTwo(_ sender: AnyObject) {
        if gameField[0][1] == 0 {
            drawFigure(button: platformTwo, whichFigure: figure)
            makeMove(positionOne: 0, positionTwo: 1)
        }
    }
    
    @IBAction func pressPlatformThree(_ sender: AnyObject) {
        if gameField[0][2] == 0 {
            drawFigure(button: platformThree, whichFigure: figure)
            makeMove(positionOne: 0, positionTwo: 2)
        }
    }
    
    @IBAction func pressPlatformFour(_ sender: AnyObject) {
        if gameField[1][0] == 0 {
            drawFigure(button: platformFour, whichFigure: figure)
            makeMove(positionOne: 1, positionTwo: 0)
        }
    }
    
    @IBAction func pressPlatformFive(_ sender: AnyObject) {
        if gameField[1][1] == 0 {
            drawFigure(button: platformFive, whichFigure: figure)
            makeMove(positionOne: 1, positionTwo: 1)
        }
    }
    
    @IBAction func pressPlatformSix(_ sender: AnyObject) {
        if gameField[1][2] == 0 {
            drawFigure(button: platformSix, whichFigure: figure)
            makeMove(positionOne: 1, positionTwo: 2)
        }
    }
    
    @IBAction func pressPlatformSeven(_ sender: AnyObject) {
        if gameField[2][0] == 0 {
            drawFigure(button: platformSeven, whichFigure: figure)
            makeMove(positionOne: 2, positionTwo: 0)
        }
    }
    
    @IBAction func pressPlatformEight(_ sender: AnyObject) {
        if gameField[2][1] == 0 {
            drawFigure(button: platformEight, whichFigure: figure)
            makeMove(positionOne: 2, positionTwo: 1)
        }
    }
    
    @IBAction func pressPlatformNine(_ sender: AnyObject) {
        if gameField[2][2] == 0 {
            drawFigure(button: platformNine, whichFigure: figure)
            makeMove(positionOne: 2, positionTwo: 2)
        }
    }
    
    func drawAIMove(position: (positionOne: Int, positionTwo: Int)) {
        var buttonDraw = UIButton()
        switch position {
        case (0,0):
            buttonDraw = platformOne
        case (0,1):
            buttonDraw = platformTwo
        case (0,2):
            buttonDraw = platformThree
        case (1,0):
            buttonDraw = platformFour
        case (1,1):
            buttonDraw = platformFive
        case (1,2):
            buttonDraw = platformSix
        case (2,0):
            buttonDraw = platformSeven
        case (2,1):
            buttonDraw = platformEight
        case (2,2):
            buttonDraw = platformNine
        default:
            print("Error")
        }
        drawFigure(button: buttonDraw, whichFigure: figureAI)
    }
    
    func drawFigure(button: UIButton, whichFigure: Int) {
        switch whichFigure {
        case 10:
            button.setImage(UIImage(named: "tac"), for: .normal)
        case 20:
            button.setImage(UIImage(named: "circle"), for: .normal)
        default:
            print("Error!")
        }
    }
}

