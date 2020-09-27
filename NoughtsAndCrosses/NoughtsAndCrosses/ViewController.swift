//
//  ViewController.swift
//  NoughtsAndCrosses
//
//  Created by Rishat on 27.09.2020.
//  Copyright © 2020 Rishat Latypov. All rights reserved.
//

import UIKit

protocol ImageViewDelegate: AnyObject {
    func pressingTheCross()
    func pressingTheNought()
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    weak var delegate: ImageViewDelegate?
    
    @IBAction func userPressTheCross(_ sender: Any){
        let controller = storyboard?.instantiateViewController(identifier: "gameID") as! GameViewController
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
        
        delegate?.pressingTheCross()
    }
    
    @IBAction func userPressTheNought(_ sender: Any){
        let controller = storyboard?.instantiateViewController(identifier: "gameID") as! GameViewController
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
        
        delegate?.pressingTheNought()
    }
    
}

