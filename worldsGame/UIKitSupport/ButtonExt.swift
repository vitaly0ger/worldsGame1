//
//  ButtonExt.swift
//  worldsGame
//
//  Created by q on 02.04.2024.
//

import UIKit

extension UIButton {
    
    convenience init(title: String, bg: UIColor){
        self.init(type: .system)
        setTitle(title, for: .normal)
        backgroundColor = bg
        layer.cornerRadius = 12
        tintColor = .white
        heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
}
