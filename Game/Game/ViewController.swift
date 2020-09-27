//
//  ViewController.swift
//  Game
//
//  Created by Albert Ahmadiev on 26.09.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, StartViewDelegate {
    @IBOutlet weak var stasusView: StatusView!
    
    @IBOutlet weak var gameView: GameView!
    
    @IBOutlet weak var startView: StartView!
    
    
    func startGame() {
        startView.isHidden = true
        gameView.element = startView.element
        gameView.isHidden = false
        print("yes")
        gameView.addButtons()
        startView.gamingStyle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startView.delegate = self
        gameView.isHidden = true
        // Do any additional setup after loading the view.
    }


}

