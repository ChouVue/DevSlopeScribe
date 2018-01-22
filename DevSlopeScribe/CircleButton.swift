//
//  CircleButton.swift
//  DevSlopeScribe
//
//  Created by Chou Vue on 1/22/18.
//  Copyright © 2018 VUE. All rights reserved.
//

import UIKit
@IBDesignable

class CircleButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 30.0 {
        didSet{
            setupView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    func setupView() {
        layer.cornerRadius = cornerRadius
    }

}
