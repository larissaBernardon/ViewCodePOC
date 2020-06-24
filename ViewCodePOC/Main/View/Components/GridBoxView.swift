//
//  GridBoxView.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 21/06/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import UIKit

class GridBoxView: UIView {
    
    var imageView = { () -> UIImageView in
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var textContainer = { () -> UIStackView in
        let view = UIStackView(frame: .zero)
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 8.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var title = { () -> UILabel in
        let view = UILabel(frame: .zero)
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var subTitle = { () -> UILabel in
        let view = UILabel(frame: .zero)
        view.backgroundColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension GridBoxView: CodeViewProtocol {
    func buildViewHierarchi() {
        addSubview(imageView)
        textContainer.addArrangedSubview(title)
        textContainer.addArrangedSubview(subTitle)
        addSubview(textContainer)
    }
    
    func setupConstraints() {
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        
        textContainer.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15).isActive = true
        textContainer.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        textContainer.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        textContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupAdditionalConfiguration() {
    }
}
