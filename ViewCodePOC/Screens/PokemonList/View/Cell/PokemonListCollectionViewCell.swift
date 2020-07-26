//
//  PokemonListCollectionViewCell.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 21/07/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

class PokemonListCollectionViewCell: UICollectionViewCell {
    
    let pokemonCollectionView = PokemonListCellView()
    var pokemon: Pokemon? {
        didSet {
            setupCell()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        pokemonCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        guard let unPokemon = pokemon else { return }
        pokemonCollectionView.presentationStyle = .collectionViewCell
        pokemonCollectionView.setup(item: unPokemon)
    }
}

extension PokemonListCollectionViewCell: CodeViewProtocol {
    func buildViewHierarchy() {
        self.contentView.addSubview(pokemonCollectionView)
    }
    
    func setupConstraints() {
        pokemonCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        pokemonCollectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
    }
    
    func setupAdditionalConfiguration() {
    }
}

extension PokemonListCollectionViewCell: ReusableView {
    static var identifier: String {
        return "CollectionCell"
    }
}
