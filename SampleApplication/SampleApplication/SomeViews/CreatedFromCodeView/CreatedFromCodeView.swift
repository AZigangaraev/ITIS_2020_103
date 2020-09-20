//
//  CreatedFromCodeView.swift
//  SampleApplication
//
//  Created by Amir Zigangaraev on 20.09.2020.
//

import UIKit

class CreatedFromCodeView: UIView {
    private let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    private let printHelloButton: UIButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    private func setup() {
        addSubview(helloLabel)
        addSubview(printHelloButton)
        
        printHelloButton.setTitle("Print \"Hello\"", for: .normal)
        printHelloButton.addTarget(self, action: #selector(printHelloTap), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = bounds.size
        helloLabel.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height * 0.5)
        printHelloButton.frame = CGRect(x: 0, y: size.height * 0.5, width: size.width, height: size.height * 0.5)
    }
    
    func set(helloPhrase: String) {
        helloLabel.text = "\(helloPhrase), world!"
    }
    
    @objc private func printHelloTap() {
        print(helloLabel.text ?? "No text in label")
    }
}
