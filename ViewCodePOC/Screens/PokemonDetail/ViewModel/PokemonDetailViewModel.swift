//
//  PokemonDetailViewModel.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 19/07/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import Foundation
import RxSwift

class PokemonDetailViewModel {
    
    // MARK: - Properties
    var networking: PokemonDetailNetworking
    var pokemonDetail: BehaviorSubject<PokemonDetail?>
    var errorMessage: BehaviorSubject<Error?>
    var pokemon: Pokemon
    
    // MARK: - Lifecycle
    init(networking: PokemonDetailNetworking, pokemon: Pokemon) {
        self.networking = networking
        self.pokemonDetail = BehaviorSubject(value: nil)
        self.errorMessage = BehaviorSubject(value: nil)
        self.pokemon = pokemon
    }
    
    // MARK: - Functions
    func fetchPokemonDetail() {
        networking.getPokemonDetail(pokemon: pokemon.name) { [weak self] result in
            switch result {
            case .success(let pokemonDetailResponse):
                self?.pokemonDetail.onNext(pokemonDetailResponse)
            case .error(let error):
                self?.errorMessage.onNext(error)
            }
        }
    }
}
