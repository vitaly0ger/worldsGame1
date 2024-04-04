//
//  Player.swift
//  worldsGame
//
//  Created by q on 02.04.2024.
//

import Foundation

class Player {
    let name: String
    private(set) var score: Int = 0
    
    init(name: String) {
        self.name = name
    }
    
    func addScore(count: Int) {
        guard count > 0 else { return }
        
        self.score += count
    }
    
}
