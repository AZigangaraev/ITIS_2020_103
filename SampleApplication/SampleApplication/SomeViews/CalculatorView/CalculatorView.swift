//
//  CalculatorView.swift
//  SampleApplication
//
//  Created by Amir Zigangaraev on 20.09.2020.
//

import UIKit

protocol CalculatorViewDelegate: AnyObject {
    func multiply(x: Int, by y: Int) -> Int
    func calculatorViewDidRequestRandomInput(_ calculatorView: CalculatorView)
}

class CalculatorView: UIView {
    weak var delegate: CalculatorViewDelegate?
    
    @IBOutlet private var xTextField: UITextField!
    @IBOutlet private var yTextField: UITextField!
    @IBOutlet private var resultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        resultLabel.text = ""
    }
    
    func set(x: Int, y: Int) {
        xTextField.text = String(x)
        yTextField.text = String(y)
    }
    
    @IBAction private func multiplyTap() {
        guard
            let xText = xTextField.text,
            let x = Int(xText),
            let yText = yTextField.text,
            let y = Int(yText),
            let delegate = delegate
        else { return }
        
        resultLabel.text = String(delegate.multiply(x: x, by: y))
    }
    
    @IBAction private func randomInputTap() {
        delegate?.calculatorViewDidRequestRandomInput(self)
    }
}
