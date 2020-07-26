//
//  PokemonDetailNetworking.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 19/07/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import Foundation
import Alamofire

protocol PokemonDetailNetworkingProtocol: AnyObject {
    func getPokemonDetail(pokemon: String, completion: @escaping (Result<PokemonDetail>) -> Void)
}

class PokemonDetailNetworking: PokemonDetailNetworkingProtocol {
    func getPokemonDetail(pokemon: String, completion: @escaping (Result<PokemonDetail>) -> Void) {
        request("https://pokeapi.co/api/v2/pokemon/\(pokemon)",
            method: .get,
            encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    let pokemonDetail = try decoder.decode(PokemonDetail.self, from: response.data!)
                    completion(Result.success(pokemonDetail))
                } catch let error {
                    completion(Result.error(error))
                }
            case .failure(let error):
                completion(Result.error(error))
            }
        }
    }
}
