//
//  StartView.swift
//  Game
//
//  Created by Albert Ahmadiev on 27.09.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import UIKit

protocol StartViewDelegate{
    func startGame()
}

class StartView: UIView, ViewStyles{
    
    @IBOutlet var buttonX: UIButton!
    @IBOutlet var buttonO: UIButton!
    var element: String!
    
    var delegate: StartViewDelegate?
    
    @IBAction func buttonTap(_ sender: UIButton){
        element = sender.titleLabel?.text
        delegate?.startGame()
    }
    
    func startGameStyle() {
        
    }
    
    func gamingStyle() {
        
    }
    
    func resultStyle(playerWin: Bool) {
        
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
