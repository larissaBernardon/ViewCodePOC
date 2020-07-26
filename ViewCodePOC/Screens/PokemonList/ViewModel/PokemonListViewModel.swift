//
//  PokemonListViewModel.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 19/07/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import Foundation

class PokemonListViewModel {
    
    // MARK: - Properties
    var pokemons: [Pokemon] = []
    var networking: PokemonListNetworking
    var reloadTableView: () -> Void = {}
    var reloadCollectionView: () -> Void = {}
    
    // MARK: - Lifecycle
    init(networking: PokemonListNetworking) {
        self.networking = networking
    }
    
    //MARK: - Functions
    func fetchPokemons(offset: Int, limit: Int) {
        networking.getPokemons(offset: offset, limit: limit) { [weak self] result in
            switch result {
            case .success(let pokemonResponse):
                if let newPokemons = self?.mapNewPokemons(pokemonResponse.results) {
                    if offset == 0 {
                        self?.pokemons = newPokemons
                    } else {
                        self?.pokemons.append(contentsOf: newPokemons)
                    }
                }
                
                self?.reloadTableView()
                self?.reloadCollectionView()
            case .error(let error):
                print(error)
            }
        }
    }
    
    func mapNewPokemons(_ pokemons: [Pokemon]) -> [Pokemon] {
        let result = pokemons.enumerated().map { (index, pokemon) -> Pokemon in
            return Pokemon(id: "\(index + 1)", name: pokemon.name)
        }
    
        return result
    }
    
    func getElementsCount() -> Int {
        return pokemons.count
    }
    
    func pokemonPerLine(row: Int) -> Pokemon? {
        if pokemons.indices.contains(row) {
            return pokemons[row]
        } else {
            return nil
        }
    }
}
