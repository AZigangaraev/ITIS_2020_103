//
//  StatusView.swift
//  Game
//
//  Created by Albert Ahmadiev on 26.09.2020.
//  Copyright © 2020 Albert Ahmadiev. All rights reserved.
//

import UIKit

class StatusView: UIView, ViewStyles{

    @IBOutlet var label: UILabel!
    
    public func startGameStyle(){
        self.label.backgroundColor = .lightGray
        self.label.text = "welcom"
    }

    public func gamingStyle() {
        self.label.backgroundColor = .blue
        self.label.text = "Playing"
    }
    
    public func resultStyle(playerWin: Bool) {
        switch playerWin {
        case true:
            self.backgroundColor = .green
            self.label.text = "Yes you got it"
        default:
            self.backgroundColor = .red
            self.label.text = "Oh no..."
        }
    }
}
