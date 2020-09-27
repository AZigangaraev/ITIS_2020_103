//
//  CellView.swift
//  TicTacToe
//
//  Created by Robert Mukhtarov on 26.09.2020.
//

import UIKit

enum CellType: Int {
    case x = 0, o = 1
}

class CellView: UIButton {
    
    var game: ViewController!
    var type: CellType?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        adjustsImageWhenHighlighted = false
        adjustsImageWhenDisabled = false
    }
    
    func reset() {
        setImage(nil, for: .normal)
        type = nil
        isEnabled = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        setType(for: game.human)
        guard !game.didPlayerWin() else {
            game.gameOver(message: "Вы победили")
            return
        }
        guard !game.isDraw() else {
            game.gameOver(message: "Ничья")
            return
        }
        game.passTurnToComputer()
    }
    
    func setType(for player: Int) {
        isEnabled = false
        type = CellType(rawValue: player)
        if type == .x {
            setImage(.xImage, for: .normal)
            tintColor = UIColor(named: "XColor")
        } else {
            setImage(.oImage, for: .normal)
            tintColor = UIColor(named: "OColor")
        }
    }
    
    static func ==(lhs: CellView, rhs: CellView) -> Bool {
        guard let leftType = lhs.type, let rightType = rhs.type else { return false }
        return leftType == rightType
    }
}

// MARK: - Extensions

extension UIImage {
    static var xImage: UIImage {
        return UIImage(systemName: "xmark", withConfiguration: .cellImageConfig)!
    }
    
    static var oImage: UIImage {
        return UIImage(systemName: "circle", withConfiguration: .cellImageConfig)!
    }
}

extension UIImage.Configuration {
    static var cellImageConfig: UIImage.SymbolConfiguration { UIImage.SymbolConfiguration(pointSize: 60, weight: .medium, scale: .large)
    }
}
