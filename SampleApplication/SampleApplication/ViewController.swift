//
//  ViewController.swift
//  SampleApplication
//
//  Created by Amir Zigangaraev on 20.09.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let helloWorldView = HelloWorldView.fromNib()
        helloWorldView.set(helloPhrase: "Hiiii")
        helloWorldView.frame.origin.y = 200
        helloWorldView.frame.size = CGSize(width: view.frame.width, height: 150)
        view.addSubview(helloWorldView)
        
        let secondView = CreatedFromCodeView(frame: CGRect(x: 0, y: 400, width: view.frame.width, height: 150))
        secondView.set(helloPhrase: "Hiiii 2")
        view.addSubview(secondView)
    }


}

