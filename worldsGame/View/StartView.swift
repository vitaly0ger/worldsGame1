//
//  StartView.swift
//  worldsGame
//
//  Created by q on 02.04.2024.
//

import UIKit

class StartView: UIView {
    let imageView = UIImageView(image: UIImage(named: "fon"))
    let label = UILabel()
    let worldTF = UITextField(placeholder: "Выберите слово")
    let firstNameTF = UITextField(placeholder: "Первый игрок")
    let secondNameTF = UITextField(placeholder: "Второй игрок")
    let startButton = UIButton(title: "Старт!", bg: UIColor(named: "purple")!)
    
    init() {
        super.init(frame: CGRect())
            backgroundColor = .systemBlue
        setViews()
        setConstraints()
    }
    
    func setViews() {
        imageView.contentMode = .scaleAspectFill
        label.text = "Words Game"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = UIColor(named: "purple")
    }
    
    func setConstraints() {
        addSubview(imageView)
        let playersStack = UIStackView(arrangedSubviews: [firstNameTF,
                                                         secondNameTF])
        
        playersStack.axis = .vertical
        playersStack.spacing = 8
        
        let stack = UIStackView(arrangedSubviews: [worldTF,
                                                   playersStack,
                                                   startButton])
        stack.axis = .vertical
        stack.spacing = 16
        addSubview(stack)
        addSubview(label)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            stack.leftAnchor.constraint(equalTo: leftAnchor, constant: 70)
        ])
        
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -30),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}






import SwiftUI

struct StartViewProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewRepresentable {
        
        let view = StartView()
        
        func makeUIView(context: Context) -> some UIView {
          return view
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) {
            
        }
    }
    
}
