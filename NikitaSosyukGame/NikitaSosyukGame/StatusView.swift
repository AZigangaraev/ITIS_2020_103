//
//  StatusView.swift
//  NikitaSosyukGame
//
//  Created by Nikita Sosyuk on 26.09.2020.
//  Copyright © 2020 Nikita Sosyuk. All rights reserved.
//

import UIKit

class StatusView: UIView {

    @IBOutlet private var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        statusLabel.text = "Начните новую игру!"
        statusLabel.textColor = .black
        statusLabel.textAlignment = .center
        statusLabel.font = UIFont.systemFont(ofSize: 23.0)
        
        self.layer.cornerRadius = 20
        self.backgroundColor = .systemFill
    }
    
    func winO() {
        statusLabel.text = "Выиграли нолики ⭕️"
        statusLabel.textColor = .white
        self.backgroundColor = .systemGreen
    }

    func winX() {
        statusLabel.text = "Выиграли крестики ❌"
        statusLabel.textColor = .white
        self.backgroundColor = .black
    }
    
    func drawnGame() {
        statusLabel.text = "Ничья😧"
        statusLabel.textColor = . black
        self.backgroundColor = .systemGray6
    }
    
    func start() {
        statusLabel.text = "Игра идет🤔"
        statusLabel.textColor = . white
        self.backgroundColor = .orange
    }
}
