//
//  PokemonListTableViewCell.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 19/07/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import UIKit
import Kingfisher

class PokemonListTableViewCell: UITableViewCell {

    let pokemonListRow = PokemonListCellView()
    var pokemon: Pokemon? {
        didSet {
            setupCell()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        pokemonListRow.translatesAutoresizingMaskIntoConstraints = false
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        guard let unPokemon = pokemon else { return }
        pokemonListRow.presentationStyle = .tableViewCell
        pokemonListRow.setup(item: unPokemon)
    }
}

extension PokemonListTableViewCell: CodeViewProtocol {
    func buildViewHierarchy() {
        self.contentView.addSubview(pokemonListRow)
    }
    
    func setupConstraints() {
        pokemonListRow.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        pokemonListRow.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        pokemonListRow.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        pokemonListRow.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
    
    func setupAdditionalConfiguration() {
        self.selectionStyle = .none
        if #available(iOS 13.0, *) {
            self.backgroundColor = .secondarySystemBackground
        }
    }
}

extension PokemonListTableViewCell: ReusableView {
    static var identifier: String {
        return "Cell"
    }
}
