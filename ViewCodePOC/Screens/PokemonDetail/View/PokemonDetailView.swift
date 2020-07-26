//
//  PokemonDetailView.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 19/07/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import UIKit
import Kingfisher

class PokemonDetailView: UIView {
    
    var nameText: String?
    
    var headerBackgroundImage = { () -> UIImageView in
        let image = UIImageView(frame: .zero)
        image.backgroundColor = .red
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var name = { () -> UILabel in
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var pokemonImage = { () -> UIImageView in
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var baseExperience = { () -> UILabel in
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var height = { () -> UILabel in
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var weight = { () -> UILabel in
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var pokeInfoView = { () -> UIImageView in
        let image = UIImageView(frame: .zero)
        image.backgroundColor = .white
        image.layer.cornerRadius = 20
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImage(item: Pokemon) {
        pokemonImage.kf.setImage(with: URL(string: item.imageUrl ?? ""))
        nameText = item.name
    }
    
    func setupItems(_ item: PokemonDetail) {
        baseExperience.text = "Base experience: \(item.base_experience ?? 0)"
        height.text = "Height: \(item.height ?? 0)"
        weight.text = "Weight: \(item.weight ?? 0)"
        print(item.id)
        name.text = "#\(item.id)  " + (nameText ?? "")
    }
}

extension PokemonDetailView: CodeViewProtocol {
    func buildViewHierarchy() {
        headerBackgroundImage.addSubview(pokemonImage)
        addSubview(headerBackgroundImage)
        pokeInfoView.addSubview(name)
        pokeInfoView.addSubview(baseExperience)
        pokeInfoView.addSubview(height)
        pokeInfoView.addSubview(weight)
        addSubview(pokeInfoView)
    }
    
    func setupConstraints() {
        headerBackgroundImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        headerBackgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        headerBackgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        headerBackgroundImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        
        pokemonImage.heightAnchor.constraint(equalTo: headerBackgroundImage.heightAnchor, multiplier: 0.6).isActive = true
        pokemonImage.widthAnchor.constraint(equalTo: headerBackgroundImage.widthAnchor, multiplier: 0.6).isActive = true
        pokemonImage.centerXAnchor.constraint(equalTo: headerBackgroundImage.centerXAnchor).isActive = true
        pokemonImage.bottomAnchor.constraint(equalTo: headerBackgroundImage.bottomAnchor, constant: -50).isActive = true
        
        name.topAnchor.constraint(equalTo: pokeInfoView.topAnchor, constant: 30).isActive = true
        name.centerXAnchor.constraint(equalTo: pokeInfoView.centerXAnchor).isActive = true
        
        baseExperience.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 70).isActive = true
        baseExperience.centerXAnchor.constraint(equalTo: pokeInfoView.centerXAnchor).isActive = true
        
        height.topAnchor.constraint(equalTo: baseExperience.bottomAnchor, constant: 30).isActive = true
        height.centerXAnchor.constraint(equalTo: pokeInfoView.centerXAnchor).isActive = true
        
        weight.topAnchor.constraint(equalTo: height.bottomAnchor, constant: 30).isActive = true
        weight.centerXAnchor.constraint(equalTo: pokeInfoView.centerXAnchor).isActive = true
        
        pokeInfoView.topAnchor.constraint(equalTo: headerBackgroundImage.bottomAnchor, constant: -30).isActive = true
        pokeInfoView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        pokeInfoView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        pokeInfoView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
        pokemonImage.backgroundColor = .red
    }
}
