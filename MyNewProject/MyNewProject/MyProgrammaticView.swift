//
//  MyProgrammaticView.swift
//  MyNewProject
//
//  Created by Amir Zigangaraev on 21.09.2020.
//

import UIKit

class MyProgrammaticView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 100, height: 100)
    }
}
