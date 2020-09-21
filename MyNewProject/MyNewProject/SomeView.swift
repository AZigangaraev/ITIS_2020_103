//
//  SomeView.swift
//  MyNewProject
//
//  Created by Amir Zigangaraev on 21.09.2020.
//

import UIKit

extension UIView {
    class func fromNib(named: String? = nil) -> Self {
        let name = named ?? String(describing: self)
        guard let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil) else {
            fatalError("missing expected nib named: \(name)")
        }
        guard let view = nib.first as? Self else {
            fatalError("view of type \(String(describing: self)) not found in \(nib)")
        }
        return view
    }
}

class SomeView: UIView {
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        label1.text = "123"
        label2.text = "345"
    }
}
