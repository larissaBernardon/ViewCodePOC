//
//  PokemonResponse.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 19/07/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import Foundation

struct PokemonResponse: Decodable {
    // MARK: - Properties
    let results: [Pokemon]
}

class Pokemon: Decodable {
    // MARK: - Properties
    var id: String?
    var name: String
    var imageUrl: String?
    var imageUrlGif: String?
    
    // MARK: - Initializer
    init(id: String?, name: String) {
        self.id = id
        self.name = name
        self.imageUrl = "https://pokeres.bastionbot.org/images/pokemon/\(id ?? "").png"
        self.imageUrlGif = "https://play.pokemonshowdown.com/sprites/ani/\(id ?? "").gif"
    }
}
