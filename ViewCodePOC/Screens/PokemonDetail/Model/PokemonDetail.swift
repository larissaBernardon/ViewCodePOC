//
//  PokemonDetail.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 22/07/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import Foundation

class PokemonDetail: Decodable {
    let base_experience: Int?
    let types: [TypeElement]?
    let weight: Int?
    let id: Int
    let height: Int?
    
    init(id: Int,
         base_experience: Int,
         types: [TypeElement]?,
         weight: Int?,
         height: Int?) {
        
        self.id = id
        self.base_experience = base_experience
        self.weight = weight
        self.height = height
        self.types = types
    }
}

class TypeElement: Decodable {
    let slot: Int
    let type: PokemonType

    init(slot: Int, type: PokemonType) {
        self.slot = slot
        self.type = type
    }
}

class PokemonType: Decodable {
    let name: String
    let url: String

    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
