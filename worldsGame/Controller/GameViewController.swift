//
//  StartViewViewController.swift
//  worldsGame
//
//  Created by q on 02.04.2024.
//

import UIKit

class GameViewController: UIViewController {

    let firstPlayer: Player
    let secondPlayer: Player
    let bigWord: String
    
    let mainView = GameView()
    
    var isFirst: Bool = true
    var words: [String] = []
    
    init(firstPlayer: Player, secondPlayer: Player, bigWord: String) {
        self.firstPlayer = firstPlayer
        self.secondPlayer = secondPlayer
        self.bigWord = bigWord
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = mainView
        setupUI()
        addActions()
        mainView.tableView.dataSource = self
    }
    
    func setupUI() {
        
        mainView.bigWordLabel.text = bigWord
        mainView.firstNameLabel.text = firstPlayer.name
        mainView.secondNameLabel.text = secondPlayer.name
        mainView.firstScoreLabel.text = "0"
        mainView.secondScoreLabel.text = "0"
    }
    
    func updateUI() {
        mainView.firstScoreLabel.text = "\(firstPlayer.score)"
        mainView.secondScoreLabel.text = "\(secondPlayer.score)"
        mainView.wordTF.text?.removeAll()
        
        mainView.tableView.reloadData()
    }
    
    
    func addActions() {
        let exitTap = UIAction { _ in
            let alert = UIAlertController(title: "Внимание!", message: "Вы уверены, что хотите выйти?" , preferredStyle: .actionSheet)
            let yesAction = UIAlertAction(title: "Да", style: .destructive) { _ in
                self.dismiss(animated: true)
            }
            let noAction = UIAlertAction(title: "Нет", style: .cancel)
            
            alert.addAction(yesAction)
            alert.addAction(noAction)
            self.present(alert, animated: true)
        }
            
        mainView.exitButton.addAction(exitTap, for: .touchUpInside)
            
        let readyTap = UIAction { _ in
            guard let word = self.mainView.wordTF.text else {return}
            guard word.count > 1 else {
                print("Слов из 1 буквы не бывает")
                return
            }
            
            guard word.lowercased() != self.bigWord.lowercased() else {
                print("слово не должно быть исходным словом")
                return
            }
            
            guard !self.words.contains(word.lowercased()) else {
                print("такое слово уже есть")
                return
            }
            
            let currentScore = self.checkWord()
            guard currentScore > 0 else {
                print("Попробуй еще!")
                return
            }
            
            
            switch self.isFirst {
            case true:
                self.firstPlayer.addScore(count: currentScore)
            case false:
                self.secondPlayer.addScore(count: currentScore)
            }
            
            self.isFirst.toggle()
            self.updateUI()
        }
        
        mainView.readyButton.addAction(readyTap, for: .touchUpInside)
    }
    
    
    func checkWord() -> Int {
        var bigChars = charsFrom(word: bigWord.lowercased())
        let littleWord = mainView.wordTF.text!.lowercased()
        let littleChars = charsFrom(word: littleWord)
        var sum = 0
        for char in littleChars {
            guard bigChars.contains(char) else {return 0}
            if let index = bigChars.firstIndex(of: char) {
                bigChars.remove(at: index)
            }
            sum += 1
        }
        words.append(littleWord)
        return sum
    }
    
    func charsFrom(word: String) -> [Character] {
        var chars = [Character]()
        word.forEach { char in
            chars.append(char)
        }
        return chars
    }
    

 

}


extension GameViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WordCell.reuseID) as! WordCell
        let word = words[indexPath.row]
        cell.wordLabel.text = word
        cell.scoreLabel.text = "\(word.count)"
        
        
        return cell
    }
    
    
}
