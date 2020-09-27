//
//  Game.swift
//  TicTacToe
//
//  Created by Robert Mukhtarov on 27.09.2020.
//
import UIKit

enum ComputerStrategy {
    case cornerStart, userCenterCornerStart, userEdgeStart, userCornerBlock, userCenterBlock, userEdgeBlock
}

extension ViewController {

    func startGame(human: Int) {
        resetCells()
        statusLabel.isHidden = true
        self.human = human
        computer = human ^ 1
        turn = 1
        computerStrategy = nil
        if computer == 0 { passTurnToComputer() }
    }
    
    func passTurnToComputer() {
        let choice = computer == 0 ? computerFirstChoice() : computerSecondChoice()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.cells[choice].setType(for: self.computer)
            if self.didPlayerWin() {
                self.gameOver(message: "Вы проиграли")
                return
            }
            if self.isDraw() { self.gameOver(message: "Ничья") }
        }
        turn += 1
    }
    
    func computerFirstChoice() -> Int {
        if turn == 1 { return [0, 2, 6, 8].randomElement()! }
        if turn == 2 {
            if cells[4].type != nil {
                computerStrategy = .userCenterCornerStart
            } else if getFreeEdges().count < 4 {
                computerStrategy = .userEdgeStart
            } else {
                computerStrategy = .cornerStart
            }
        }
        return makeChoice(for: computerStrategy!)
    }
    
    func computerSecondChoice() -> Int {
        if turn == 1 {
            if getFreeCorners().count < 4 {
                computerStrategy = .userCornerBlock
            } else if cells[4].type != nil {
                computerStrategy = .userCenterBlock
            } else {
                computerStrategy = .userEdgeBlock
            }
        }
        return makeChoice(for: computerStrategy!)
    }

    
    func makeChoice(for strategy: ComputerStrategy) -> Int {
        if let cellForWin = cellForWin(type: CellType(rawValue: computer)!) {
            return cellForWin
        }
        if let cellForBlock = cellForWin(type: CellType(rawValue: human)!) {
            return cellForBlock
        }
        
        switch strategy {
        case .cornerStart:
            let freeCorners = getFreeCorners()
            if freeCorners.isEmpty {
                return cellForWin(type: .x)!
            } else {
                return freeCorners.randomElement()!
            }
        case .userCenterCornerStart:
            if turn == 2 {
                var selectedTriple = [Int]()
                for triple in [[0, 4, 8], [2, 4, 6]] {
                    var counter = 0
                    for i in triple {
                        if cells[i].type != nil { counter += 1 }
                    }
                    if counter == 2 { selectedTriple = triple; break }
                }
                for i in selectedTriple {
                    if cells[i].type == nil { return i }
                }
                return -1
            } else {
                return getFreeCells().randomElement()!
            }
        case .userEdgeStart:
            if turn == 2 {
                return 4
            } else {
                return getFreeCells().randomElement()!
            }
        case .userCornerBlock, .userEdgeBlock:
            if turn == 1 {
                return 4
            } else if turn == 2 {
                return getFreeEdges().randomElement()!
            } else {
                return getFreeCells().randomElement()!
            }
        case .userCenterBlock:
            if turn == 1 || turn == 2 {
                return getFreeCorners().randomElement()!
            }
            else {
                return getFreeCells().randomElement()!
            }
        }
    }
    
    func getFreeCorners() -> [Int] {
        var freeCorners = [Int]()
        for i in [0, 2, 6, 8] {
            if cells[i].type == nil { freeCorners.append(i) }
        }
        return freeCorners
    }
    
    func getFreeEdges() -> [Int] {
        var freeEdges = [Int]()
        for i in [1, 3, 5, 7] {
            if cells[i].type == nil { freeEdges.append(i) }
        }
        return freeEdges
    }
    
    func getFreeCells() -> [Int] {
        var result = [Int]()
        for i in 0..<cells.count {
            if cells[i].type == nil { result.append(i) }
        }
        return result
    }
    
    func cellForWin(type: CellType) -> Int? {
        var tripleToWin: [Int]
        for triple in triplesExcludingFull() {
            var counter = 0
            for i in triple {
                if cells[i].type == type { counter += 1 }
            }
            if counter == 2 {
                tripleToWin = triple
                var winningCell = -1
                for i in tripleToWin {
                    if cells[i].type == nil {
                        winningCell = i
                        break
                    }
                }
                return winningCell
            }
        }
        return nil
    }
    
    func triplesExcludingFull() -> [[Int]] {
        var result: [[Int]] = []
        for triple in triples {
            for i in triple {
                if cells[i].type == nil {
                    result.append(triple)
                    break
                }
            }
        }
        return result
    }
        
    func didPlayerWin() -> Bool {
        for triple in triples {
            if isTripleWinning(triple) { return true }
        }
        return false
    }
    
    func isTripleWinning(_ triple: [Int]) -> Bool {
        return cells[triple[0]] == cells[triple[1]] && cells[triple[1]] == cells[triple[2]]
    }
    
    func isDraw() -> Bool {
        for cell in cells {
            if cell.type == nil { return false }
        }
        return true
    }
    
    func gameOver(message: String) {
        statusLabel.isHidden = false
        statusLabel.text = message
        for cell in cells {
            cell.isEnabled = false
        }
    }
}
