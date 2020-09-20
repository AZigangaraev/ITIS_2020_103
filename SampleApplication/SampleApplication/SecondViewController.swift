//
//  SecondViewController.swift
//  SampleApplication
//
//  Created by Amir Zigangaraev on 20.09.2020.
//

import UIKit

class SecondViewController: UIViewController, CalculatorViewDelegate {
    func multiply(x: Int, by y: Int) -> Int {
        x * y
    }
    
    func calculatorViewDidRequestRandomInput(_ calculatorView: CalculatorView) {
        calculatorView.set(x: .random(in: 1...100), y: .random(in: 100..<200))
    }
    
    @IBOutlet private var calculatorView: CalculatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatorView.delegate = self
    }
}
