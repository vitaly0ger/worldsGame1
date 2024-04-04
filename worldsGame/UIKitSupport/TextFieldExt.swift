//
//  TextFieldExt.swift
//  worldsGame
//
//  Created by q on 02.04.2024.
//

import UIKit

extension UITextField {
    
    convenience init(placeholder: String) {
        self.init()
        self.placeholder = placeholder
        backgroundColor = .white
        layer.cornerRadius = 12
        heightAnchor.constraint(equalToConstant: 36).isActive = true
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        leftViewMode = .always
    }
}
