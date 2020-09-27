//
//  GameViewController.swift
//  NoughtsAndCrosses
//
//  Created by Rishat on 27.09.2020.
//  Copyright © 2020 Rishat Latypov. All rights reserved.
//

import UIKit

public class GameViewController: UIViewController, ImageViewDelegate {
    
    @IBOutlet weak var cell1: UIImageView!
    @IBOutlet weak var cell2: UIImageView!
    @IBOutlet weak var cell3: UIImageView!
    @IBOutlet weak var cell4: UIImageView!
    @IBOutlet weak var cell5: UIImageView!
    @IBOutlet weak var cell6: UIImageView!
    @IBOutlet weak var cell7: UIImageView!
    @IBOutlet weak var cell8: UIImageView!
    @IBOutlet weak var cell9: UIImageView!
    
    var userChoices: [Cell] = []
    var computerChoices: [Cell] = []
    var lastValue = "o"
    
    var userPlayer: UIImage!
    var computerPlayer: UIImage!
    
    func pressingTheNought() {
        userPlayer = UIImage(named: "zero.jpg")
        computerPlayer = UIImage(named: "Cross.jpg")
    }
    
    func pressingTheCross() {
        userPlayer = UIImage(named: "Cross.jpg")
        computerPlayer = UIImage(named: "zero.jpg")
    }
    
    @IBOutlet weak var viewController: ViewController!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        viewController.delegate = self
        
            createTap(on: cell1, type: .one)
            createTap(on: cell2, type: .two)
            createTap(on: cell3, type: .three)
            createTap(on: cell4, type: .four)
            createTap(on: cell5, type: .five)
            createTap(on: cell6, type: .six)
            createTap(on: cell7, type: .seven)
            createTap(on: cell8, type: .eight)
            createTap(on: cell9, type: .nine)
        }
        
        func createTap(on imageView: UIImageView, type box: Cell) {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.cellClicked(_:)))
            tap.name = box.rawValue
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tap)
        }
    
        @objc func cellClicked(_ sender: UITapGestureRecognizer) {
            let selectedBox = getCell(from: sender.name ?? "")
            makeChoice(selectedBox)
            userChoices.append(Cell(rawValue: sender.name!)!)
            checkIfWon()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.computerPlay()
            }
        }
    
    func computerPlay() {
            var availableSpaces = [UIImageView]()
            var availableBoxes = [Cell]()
            for name in Cell.allCases {
                let box = getCell(from: name.rawValue)
                if box.image == nil {
                    availableSpaces.append(box)
                    availableBoxes.append(name)
                }
            }
            
            guard availableBoxes.count > 0 else { return }
            
            let randIndex = Int.random(in: 0 ..< availableSpaces.count)
            makeChoice(availableSpaces[randIndex])
            computerChoices.append(availableBoxes[randIndex])
            checkIfWon()
        }
        
        func makeChoice(_ selectedBox: UIImageView) {
            guard selectedBox.image == nil else { return }
            
            if lastValue == "x" {
                selectedBox.image = UIImage(named: "zero.jpg")
                lastValue = "o"
            } else {
                selectedBox.image = UIImage(named: "Cross.jpg")
                lastValue = "x"
            }
        }
        
        func checkIfWon() {
            var correct = [[Cell]]()
            let firstRow: [Cell] = [.one, .two, .three]
            let secondRow: [Cell] = [.four, .five, .six]
            let thirdRow: [Cell] = [.seven, .eight, .nine]
            
            let firstCol: [Cell] = [.one, .four, .seven]
            let secondCol: [Cell] = [.two, .five, .six]
            let thirdCol: [Cell] = [.three, .six, .nine]
            
            let backwardSlash: [Cell] = [.one, .five, .nine]
            let forwardSlash: [Cell] = [.three, .five, .seven]
            
            correct.append(firstRow)
            correct.append(secondRow)
            correct.append(thirdRow)
            correct.append(firstCol)
            correct.append(secondCol)
            correct.append(thirdCol)
            correct.append(backwardSlash)
            correct.append(forwardSlash)
            
        }
        
        func resetGame() {
            for name in Cell.allCases {
                let cell = getCell(from: name.rawValue)
                cell.image = nil
            }
            lastValue = "o"
            userChoices = []
            computerChoices = []
        }
        
        func getCell(from name: String) -> UIImageView {
            let cell = Cell(rawValue: name) ?? .one
            
            switch cell {
            case .one:
                return cell1
            case .two:
                return cell2
            case .three:
                return cell3
            case .four:
                return cell4
            case .five:
                return cell5
            case .six:
                return cell6
            case .seven:
                return cell7
            case .eight:
                return cell8
            case .nine:
                return cell9
            }
        }
    }

enum Cell: String, CaseIterable {
    case one, two, three, four, five, six, seven, eight, nine
}

