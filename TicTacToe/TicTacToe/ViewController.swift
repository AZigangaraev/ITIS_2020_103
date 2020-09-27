//
//  ViewController.swift
//  TicTacToe
//
//  Created by Robert Mukhtarov on 26.09.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var cells: [CellView]! {
        didSet { cells.sort { $0.tag < $1.tag } }
    }
    var human: Int!
    var computer: Int!
    var turn: Int!
    var computerStrategy: ComputerStrategy?
    let triples = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                   [0, 3, 6], [1, 4, 7], [2, 5, 8],
                   [0, 4, 8], [2, 4, 6]]
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        for cell in cells {
            cell.game = self
            cell.isEnabled = false
        }
        statusLabel.font = UIFont.boldSystemFont(ofSize: 26.0)
    }
    
    @IBAction func newGamePressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Новая игра", message: "Чем Вы хотите играть?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Крестики (первый ход)", style: .default) { _ in self.startGame(human: 0) })
        alert.addAction(UIAlertAction(title: "Нолики (второй ход)", style: .default) { _ in self.startGame(human: 1) })
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        present(alert, animated: true)
    }
    
    func resetCells() {
        for cell in cells {
            cell.reset()
        }
    }
}

