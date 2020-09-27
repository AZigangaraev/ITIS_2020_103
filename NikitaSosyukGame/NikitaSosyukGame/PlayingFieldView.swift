//
//  PlayingFieldView.swift
//  NikitaSosyukGame
//
//  Created by Nikita Sosyuk on 26.09.2020.
//  Copyright © 2020 Nikita Sosyuk. All rights reserved.
//

import UIKit

class PlayingFieldView: UIView {
    
    @IBOutlet private var imageView: UIImageView!
    
    override func awakeFromNib() {
        imageView.image = #imageLiteral(resourceName: "PlayField")
    }
    
}
