//
//  viewControllerScreen.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 21/06/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import UIKit

class ViewControllerScreen: UIView {
    
   var button = { () -> UIButton in
       let view = UIButton(frame: .zero)
       view.backgroundColor = .purple
       view.setTitle("meu botão em view code", for: .normal)
       view.layer.cornerRadius = 10
       view.translatesAutoresizingMaskIntoConstraints = false
    return view
   }()
    
   var card = { () -> UIView in
        let view = UIView(frame: .zero)
        view.backgroundColor = .cyan
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .center
        return view
   }()
    
   private lazy var gridContainer = { () -> UIStackView in
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 8.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //var card = RoundedCard()
    var gridBoxViewLeft = GridBoxView()
    var gridBoxViewRight = GridBoxView()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ViewControllerScreen: CodeViewProtocol {
    func buildViewHierarchi() {
        addSubview(button)
        addSubview(card)
        gridContainer.addArrangedSubview(gridBoxViewLeft)
        gridContainer.addArrangedSubview(gridBoxViewRight)
        addSubview(gridContainer)
    }
    
    func setupConstraints() {
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
        
        gridContainer.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        gridContainer.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        gridContainer.heightAnchor.constraint(equalToConstant: 220).isActive = true
        gridContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        card.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        card.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        card.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        card.heightAnchor.constraint(equalToConstant: 140).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .darkGray
    }
}
