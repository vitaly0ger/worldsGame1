//
//  GameView.swift
//  worldsGame
//
//  Created by q on 02.04.2024.
//

import UIKit

class GameView: UIView {
    
    let fonImageView = UIImageView(image: UIImage(named: "fon")!)

    let exitButton = UIButton(title: "Выход", bg: .red)
    let bigWordLabel = UILabel()
    
    let firstNameLabel = UILabel(text: "Вася",
                                 height: 22,
                                 isDark: false)
    let firstScoreLabel = UILabel(text: "35",
                                  height: 60,
                                  isDark: false)
    
    let secondNameLabel = UILabel(text: "Федя",
                                 height: 22,
                                 isDark: false)
    let secondScoreLabel = UILabel(text: "53",
                                  height: 60,
                                  isDark: false)
    
    let wordTF = UITextField(placeholder: "Ваше слово...")
    let readyButton = UIButton(title: "Готово", bg: UIColor(named: "purple")!)
    let tableView = UITableView()
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = .systemPurple
        setViews()
        setConstraints()
    }
    

   func setViews() {
       backgroundColor = .white
       bigWordLabel.text = "Магнитотерпия"
       bigWordLabel.font = UIFont.boldSystemFont(ofSize: 20)
       bigWordLabel.textAlignment = .center
       fonImageView.contentMode = .scaleToFill
       wordTF.textAlignment = .center
       tableView.backgroundColor = .clear
       tableView.register(WordCell.self, forCellReuseIdentifier: WordCell.reuseID)
       tableView.layer.borderColor = UIColor.black.cgColor
       tableView.layer.borderWidth = 2
       
   }

   func setConstraints() {
       addSubview(fonImageView)
       addSubview(exitButton)
       
       
       let firstStack = UIStackView(views: [firstScoreLabel, firstNameLabel],
                                    axis: .vertical,
                                    spacing: 0,
                                    alignment: .fill)
       
       let secondStack = UIStackView(views: [secondScoreLabel, secondNameLabel],
                                    axis: .vertical,
                                    spacing: 0,
                                    alignment: .fill)
       
       let playersStack = UIStackView(views: [firstStack, secondStack],
                                      axis: .horizontal,
                                      spacing: 16)
       
       let stack = UIStackView(views: [bigWordLabel, playersStack, wordTF, readyButton, tableView],
                               axis: .vertical,
                               spacing: 12,
                               alignment: .fill)
       
       firstStack.layer.cornerRadius = 20
       secondStack.layer.cornerRadius = 20
       
       
       firstStack.backgroundColor = UIColor(named: "firstPlayer")
       secondStack.backgroundColor = UIColor(named: "secondPlayer")
       
       addSubview(stack)
       
       exitButton.translatesAutoresizingMaskIntoConstraints = false
       stack.translatesAutoresizingMaskIntoConstraints = false
       fonImageView.translatesAutoresizingMaskIntoConstraints = false
       
       NSLayoutConstraint.activate([
        exitButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
        exitButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        exitButton.widthAnchor.constraint(equalToConstant: 60)
       ])
       
       NSLayoutConstraint.activate([
        stack.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 2),
        stack.centerXAnchor.constraint(equalTo: centerXAnchor),
        stack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
       ])
       
       NSLayoutConstraint.activate([
           fonImageView.topAnchor.constraint(equalTo: topAnchor),
           fonImageView.leftAnchor.constraint(equalTo: leftAnchor),
           fonImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
           fonImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
       
       ])
       
       NSLayoutConstraint.activate([
        firstStack.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.45),
        secondStack.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.45),
        firstStack.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
        secondStack.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35)
       ])
       
       NSLayoutConstraint.activate([
        firstScoreLabel.heightAnchor.constraint(equalTo: firstStack.heightAnchor, multiplier: 0.7),
        secondScoreLabel.heightAnchor.constraint(equalTo: firstStack.heightAnchor, multiplier: 0.7)
       ])
       
     
   }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}










import SwiftUI

struct GameViewProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewRepresentable {
        
        let view = GameView()
        
        func makeUIView(context: Context) -> some UIView {
          return view
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) {
            
        }
    }
    
}
