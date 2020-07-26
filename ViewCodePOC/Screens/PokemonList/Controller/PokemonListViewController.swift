//
//  ViewController.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 21/06/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import UIKit

class PokemonListViewController: UIViewController {
    
    // MARK: - UIView
    private let pokemonListView = PokemonListView()
    
    // MARK: - Properties
    private var viewModel: PokemonListViewModel!
    private let networking = PokemonListNetworking()
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    private let pokemonListRowHeight: CGFloat = 150
    var presentationStyle: PresentationStyle?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func loadView() {
        self.view = pokemonListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBind()
        setupStyle()
        setupNavigationController()
        setupTableView()
        setupCollectionView()
        fetch()
    }
    
    private func setupBind() {
        viewModel = PokemonListViewModel(networking: networking)
        viewModel.reloadTableView = pokemonListView.tableView.reloadData
        viewModel.reloadCollectionView = pokemonListView.collectionView.reloadData
    }
    
    private func setupStyle() {
        pokemonListView.presentationStyle = presentationStyle
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = .red
    }
    
    private func setupCollectionView() {
        self.pokemonListView.collectionView.delegate = self
        self.pokemonListView.collectionView.dataSource = self
    }
    
    private func setupTableView() {
        self.pokemonListView.tableView.delegate = self
        self.pokemonListView.tableView.dataSource = self
        
        pokemonListView.tableView.register(PokemonListTableViewCell.self, forCellReuseIdentifier: PokemonListTableViewCell.identifier)
        pokemonListView.collectionView.register(PokemonListCollectionViewCell.self, forCellWithReuseIdentifier: PokemonListCollectionViewCell.identifier)
    }
    
    private func navigateToDetail(_ indexPathRow: Int) {
        let controller = PokemonDetailViewController()
        controller.modalPresentationStyle = .fullScreen
        controller.pokemon = viewModel.pokemons[indexPathRow]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func fetch() {
        viewModel.fetchPokemons(offset: 0, limit: 20)
    }
}

extension PokemonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getElementsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let unCell = tableView.dequeueReusableCell(withIdentifier: PokemonListTableViewCell.identifier, for: indexPath) as? PokemonListTableViewCell {
            unCell.pokemon = viewModel.pokemons[indexPath.row]
            return unCell
        }
        
        return UITableViewCell()
    }
}

extension PokemonListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return pokemonListRowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToDetail(indexPath.row)
    }
}

extension PokemonListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (screenWidth / 2) - 15, height: (screenHeight / 3.5) - 40)
    }
}

extension PokemonListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getElementsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let unCell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonListCollectionViewCell.identifier, for: indexPath) as? PokemonListCollectionViewCell {
            unCell.pokemon = viewModel.pokemons[indexPath.row]
            
            return unCell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigateToDetail(indexPath.row)
    }
}

