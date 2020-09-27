//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Никита Ляпустин on 27.09.2020.
//  Copyright © 2020 Pasandep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userSide: UIImage!
    var phoneSide: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toGameVCSegue" else { return }
        guard let destination = segue.destination as? GameViewController else {
            return
        }
        
        destination.userSide = userSide
        destination.phoneSide = phoneSide
    }
    
    
    @IBAction func circleButtonTapped(_ sender: Any) {
        userSide = UIImage(named: "Circle.png")
        phoneSide = UIImage(named: "Cross.png")
        performSegue(withIdentifier: "toGameVCSegue", sender: nil)
    }
    
    @IBAction func crossButtonTapped(_ sender: Any) {
        userSide = UIImage(named: "Cross.png")
        phoneSide = UIImage(named: "Circle.png")
        performSegue(withIdentifier: "toGameVCSegue", sender: nil)
    }
}

