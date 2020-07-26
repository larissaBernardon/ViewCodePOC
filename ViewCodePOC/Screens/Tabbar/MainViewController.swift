//
//  MainViewController.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 22/07/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    // MARK: - Properties
    let firstViewController =  PokemonListViewController()
    let secondViewController = PokemonListViewController()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarControllers()
    }
    
    private func setupTabbarControllers() {
        firstViewController.tabBarItem = UITabBarItem(title: "Listagem".uppercased(), image: UIImage(), tag: 0)
        secondViewController.tabBarItem = UITabBarItem(title: "Coleção".uppercased(), image: UIImage(), tag: 1)
        
        firstViewController.presentationStyle = .tableViewCell
        secondViewController.presentationStyle = .collectionViewCell
        
        let tabBarList = [firstViewController, secondViewController]
        
        
        
        viewControllers = tabBarList
    }
}
