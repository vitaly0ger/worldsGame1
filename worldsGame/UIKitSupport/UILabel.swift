//
//  UILabel.swift
//  worldsGame
//
//  Created by q on 02.04.2024.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, height: CGFloat, isDark: Bool) {
        self.init()
        self.text = text
        self.font = UIFont.systemFont(ofSize: height)
        self.textColor = isDark ? .black : .white
        self.textAlignment = .center
    }
}
