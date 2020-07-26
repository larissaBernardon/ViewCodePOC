//
//  PokemonDetailViewController.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 19/07/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

class PokemonDetailViewController: UIViewController {
    
    // Mark: - UIView
    let detailView = PokemonDetailView()
    
    // Mark: - Properties
    private var viewModel: PokemonDetailViewModel!
    private var networking = PokemonDetailNetworking()
    private let disposeBag = DisposeBag()
    var pokemon: Pokemon? {
        didSet {
            setupImage()
        }
    }
    
    var pokemonDetail: PokemonDetail? {
        didSet {
            setupViewComponents()
        }
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBind()
        fetch()
    }
    
    // MARK: - Functions
    private func setupBind() {
        guard let unPokemon = pokemon else { return }
        viewModel = PokemonDetailViewModel(networking: networking, pokemon: unPokemon)

        viewModel.pokemonDetail.subscribe({ [weak self] response in
            guard let strongSelf = self, let unElement = response.element, let unPokemon = unElement else { return }
            strongSelf.pokemonDetail = unPokemon
            
        }).disposed(by: disposeBag)
    }
    
    private func setupImage() {
        guard let unPokemon = pokemon else { return }
        detailView.setupImage(item: unPokemon)
    }
    
    private func setupViewComponents() {
        guard let unPokemonDetail = pokemonDetail else { return }
        detailView.setupItems(unPokemonDetail)
    }
    
    private func fetch() {
        viewModel.fetchPokemonDetail()
    }
}
