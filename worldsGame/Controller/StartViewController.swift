//
//  StartViewController.swift
//  worldsGame
//
//  Created by q on 02.04.2024.
//

import UIKit

class StartViewController: UIViewController {

    let mainView = StartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        
        addActions()
    }

    func addActions() {
        
        let startTap = UIAction { _ in
            
            guard let word = self.mainView.worldTF.text,
                  var firstName = self.mainView.firstNameTF.text,
                  var secondName = self.mainView.secondNameTF.text else { return }
            
            
            guard word.count >= 8 else {
                
                let alert = UIAlertController(title: "Ошибка!", message: "Слово должно состоять из 8 символов", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                return
                
                }
            
            if firstName == "" {
                firstName = "Игрок 1"
            }
            
            if secondName == "" {
                secondName = "Игрок 2"
            }
            
            let player1 = Player(name: firstName)
            let player2 = Player(name: secondName)
            
            let gameVC = GameViewController(firstPlayer: player1, secondPlayer: player2, bigWord: word)
            gameVC.modalPresentationStyle = .fullScreen
            
            self.mainView.worldTF.text?.removeAll()
            self.mainView.firstNameTF.text?.removeAll()
            self.mainView.secondNameTF.text?.removeAll()
            
            self.present(gameVC, animated: true)
        
        }
        
        mainView.startButton.addAction(startTap, for: .touchUpInside)
        
    }
    
    

}

