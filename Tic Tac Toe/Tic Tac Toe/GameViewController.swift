//
//  GameViewController.swift
//  Tic Tac Toe
//
//  Created by Никита Ляпустин on 27.09.2020.
//  Copyright © 2020 Pasandep. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var userSide: UIImage!
    var phoneSide: UIImage!
    var phone = 1
    var user = 2
    var tableValues = [0, 0, 0, 0, 0, 0, 0, 0, 0] // 0 - ячейка пуста, 1 - заполнена пользователем, 2 - заполнена программой
    var winningСombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3 ,6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive: Bool = true
    
    @IBOutlet var firstCell: UIButton!
    @IBOutlet var secondCell: UIButton!
    @IBOutlet var thirdCell: UIButton!
    @IBOutlet var fourthCell: UIButton!
    @IBOutlet var fifthCell: UIButton!
    @IBOutlet var sixthCell: UIButton!
    @IBOutlet var seventhCell: UIButton!
    @IBOutlet var eighthCell: UIButton!
    @IBOutlet var ninthCell: UIButton!
    
    var buttonArray: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableValues[0] = 2
        firstCell.setImage(phoneSide, for: UIControl.State())
        // Do any additional setup after loading the view.
        
        buttonArray.append(firstCell)
        buttonArray.append(secondCell)
        buttonArray.append(thirdCell)
        buttonArray.append(fourthCell)
        buttonArray.append(fifthCell)
        buttonArray.append(sixthCell)
        buttonArray.append(seventhCell)
        buttonArray.append(eighthCell)
        buttonArray.append(ninthCell)
    }
    
    @IBAction func cellTapped(_ sender: AnyObject) {
        if (gameIsActive){
            if (tableValues[sender.tag-1] == 0){
                sender.setImage(userSide, for: UIControl.State())
                tableValues[sender.tag-1] = 1
            }
            
            if (checkForWin(whom: user, table: tableValues)){
                print("user is a winner!")
                gameIsActive = false
            }
            
            var phoneMove = minimaxAlgorithm(table: tableValues, player: phone)
            buttonArray[phoneMove.0].setImage(phoneSide, for: UIControl.State())
            tableValues[phoneMove.0] = phone
            
            if (checkForWin(whom: user, table: tableValues)){
                print("phone is a winner!")
                gameIsActive = false
            }
        }
    }
    
    private func checkForWin(whom: Int, table: [Int]) -> Bool{
        for winningCombination in winningСombinations {
            if (table[winningCombination[0]] != 0 &&
                table[winningCombination[0]] == table[winningCombination[1]] &&
                table[winningCombination[1]] == table[winningCombination[2]] &&
                table[winningCombination[0]] == whom){
                return true
            }
        }
        return false
    }
    
    private func minimaxAlgorithm(table: [Int], player: Int) -> (Int, Int){
        
        var newTable = table
        
        let availableСells = getEmptyCells(from: table)
        
        if (checkForWin(whom: phone, table: table)){
            return (-1, 10)
        } else if (checkForWin(whom: user, table: table)){
            return (-1, -10)
        } else if (availableСells.count == 0){
            return (-1, 0)
        }
        
        var moves: [(Int, Int)] = []
        
        for i in 0...availableСells.count - 1{
            var move: (Int, Int) = (-1, -1)// Первое значение - индекс ячейки, второе - счёт для алгоритма
           
            move.0 = table[availableСells[i]]
            
            newTable[availableСells[i]] = player
            
            if (player == phone){
                let result = minimaxAlgorithm(table: newTable, player: user)
                move.1 = result.1;
            } else{
                let result = minimaxAlgorithm(table: newTable, player: phone)
                move.1 = result.1;
            }
            
            newTable[availableСells[i]] = move.0
            
            moves.append(move)
        }
        
        var bestMove = -1
        if(player == phone){
            var bestScore = -10000
            for i in 0...moves.count - 1{
                if (moves[i].1 > bestScore){
                    bestScore = moves[i].1
                    bestMove = i
                }
            }
        } else {
            var bestScore = 10000
            for i in 0...moves.count - 1{
                if (moves[i].1 < bestScore){
                    bestScore = moves[i].1
                    bestMove = i
                }
            }
        }
        
        return moves[bestMove]
    }
    
    private func getEmptyCells(from table: [Int]) -> [Int]{
        var result: [Int] = []
        for i in 0...table.count - 1 {
            if (table[i] == 0){
                result.append(i)
            }
        }
        return result
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
