//
//  WordCell.swift
//  worldsGame
//
//  Created by q on 03.04.2024.
//

import UIKit

class WordCell: UITableViewCell {

    static let reuseID = "WorldCell"
    let wordLabel = UILabel()
    let scoreLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraints()
        scoreLabel.textAlignment = .right
    }
    
    func setConstraints() {
        let stack = UIStackView(views: [wordLabel, scoreLabel], axis: .horizontal, spacing: 20)
        addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 4),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
