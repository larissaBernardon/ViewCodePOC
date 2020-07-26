//
//  PokemonListView.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 21/06/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import UIKit

class PokemonListView: UIView {
    
    var tableView = UITableView()
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    var presentationStyle: PresentationStyle? {
        didSet {
            setupView()
        }
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableViewConstraints() {
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupCollectionViewConstraints() {
        collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
}

extension PokemonListView: CodeViewProtocol {
    func buildViewHierarchy() {
        presentationStyle == .tableViewCell ? addSubview(tableView) : addSubview(collectionView)
    }
    
    func setupConstraints() {
        presentationStyle == .tableViewCell ? setupTableViewConstraints() : setupCollectionViewConstraints()
    }
    
    func setupAdditionalConfiguration() {
        tableView.indicatorStyle = .white
        collectionView.indicatorStyle = .white
        tableView.separatorStyle = .none
        
        if #available(iOS 13.0, *) {
            self.backgroundColor = .secondarySystemBackground
            tableView.backgroundColor = .secondarySystemBackground
            collectionView.backgroundColor = .secondarySystemBackground
        }
    }
}


