//
//  ViewController.swift
//  NikitaSosyukGame
//
//  Created by Nikita Sosyuk on 26.09.2020.
//  Copyright © 2020 Nikita Sosyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var statusView: StatusView!
    @IBOutlet private var startButton: UIButton!
    @IBOutlet private var figureCheck: UISegmentedControl!
    @IBOutlet weak var gameField: GameFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.setTitle("Новая игра", for: .normal)
        startButton.tintColor = .systemPink
        
        figureCheck.setTitle("Крестик", forSegmentAt: 0)
        figureCheck.setTitle("Нолик", forSegmentAt: 1)
        gameField.statusView = self.statusView
    }
    
    @IBAction func buttonGameAction(_ sender: Any) {
        if figureCheck.selectedSegmentIndex == 0 {
            gameField.startGame(figureIndex: 10)
        } else {
            gameField.startGame(figureIndex: 20)
        }
        statusView.start()
    }
    
}

