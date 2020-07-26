//
//  PokemonListNetworking.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 19/07/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import Foundation
import Alamofire

enum Result<T> {
    case success(T)
    case error(Error)
}

protocol PokemonListNetworkingProtocol: AnyObject {
    func getPokemons(offset: Int, limit: Int, completion: @escaping (Result<PokemonResponse>) -> Void)
}

class PokemonListNetworking: PokemonListNetworkingProtocol {
    func getPokemons(offset: Int, limit: Int, completion: @escaping (Result<PokemonResponse>) -> Void) {
        
        var parameters: [String: Any] = [:]
        parameters["offset"] = offset
        parameters["limit"] = limit
        
        request("https://pokeapi.co/api/v2/pokemon/",
                method: .get,
                parameters: parameters,
                encoding: URLEncoding.default,
                headers: nil).responseJSON { response in
            self.responseJSON(result: response)
            switch response.result {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    let pokemonResponse = try decoder.decode(PokemonResponse.self, from: response.data!)
                    completion(Result.success(pokemonResponse))
                } catch let error {
                    completion(Result.error(error))
                }
            case .failure(let error):
                completion(Result.error(error))
            }
        }
    }
    
    func responseJSON(result: DataResponse<Any>) {
        guard let unResponse = result.response,
            let unUrl = unResponse.url else {
                print("responseJSON: no result.response")
                return
        }

        guard let unData = result.data else {
            print("responseJSON: no result.data")
            return
        }
        do {
            let json = try? JSONSerialization.jsonObject(with: unData, options: [])
            if let unJson = json {
                print("responseJSON: \(unUrl) \n \(unJson)")
            } else { print("responseJSON: \(unUrl) no json")}
        }
    }
}
