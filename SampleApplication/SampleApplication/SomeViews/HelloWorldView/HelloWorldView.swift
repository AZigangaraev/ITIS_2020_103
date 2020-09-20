//
//  HelloWorldView.swift
//  SampleApplication
//
//  Created by Amir Zigangaraev on 20.09.2020.
//

import UIKit

class HelloWorldView: UIView {
    @IBOutlet private var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.text = "Hello, world!"
    }
    
    func set(helloPhrase: String) {
        label.text = "\(helloPhrase), world!"
    }
    
    @IBAction private func printHelloTap() {
        print(label.text ?? "No text")
    }
}
