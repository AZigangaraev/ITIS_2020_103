//
//  ViewController.swift
//  MyNewProject
//
//  Created by Amir Zigangaraev on 21.09.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var label1: UILabel!
    @IBOutlet private var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label1.text = "Hello"
        label2.text = "There"
        
        let someView = SomeView.fromNib()
        someView.backgroundColor = .cyan
        someView.frame = CGRect(x: 20, y: 100, width: 300, height: 200)
        view.addSubview(someView)
    }


}

