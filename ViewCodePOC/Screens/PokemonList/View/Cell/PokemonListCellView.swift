//
//  PokemonListTableViewCellView.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 19/07/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import UIKit
import Kingfisher

enum PresentationStyle {
    case tableViewCell
    case collectionViewCell
}

class PokemonListCellView: UIView {
    var presentationStyle: PresentationStyle? {
        didSet {
            setupView()
        }
    }
    
    var name = { () -> UILabel in
        let name = UILabel(frame: .zero)
        name.textColor = .black
        name.textAlignment = .left
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    var image = { () -> UIImageView in
        let image = UIImageView(frame: .zero)
        image.image = UIImage()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(item: Pokemon) {
        name.text = item.name
        image.kf.setImage(with: URL(string: item.imageUrl ?? ""))
    }
    
    private func setupTableViewCellConstraints() {
        image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20).isActive = true
        name.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        name.centerYAnchor.constraint(equalTo: image.centerYAnchor).isActive = true
    }
    
    private func setupCollectionCellConstraints() {
        image.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        image.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6).isActive = true
        image.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6).isActive = true
        image.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
       
        name.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10).isActive = true
        name.centerXAnchor.constraint(equalTo: image.centerXAnchor).isActive = true
    }
}

extension PokemonListCellView: CodeViewProtocol {
    func buildViewHierarchy() {
        addSubview(image)
        addSubview(name)
    }
    
    func setupConstraints() {
        presentationStyle == .tableViewCell ? setupTableViewCellConstraints() : setupCollectionCellConstraints()
        
    }
    
    func setupAdditionalConfiguration() {
        self.layer.cornerRadius = 10
        self.backgroundColor = .white
    }
}
