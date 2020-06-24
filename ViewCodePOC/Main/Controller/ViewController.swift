//
//  ViewController.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 21/06/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let screen = ViewControllerScreen()
    
    override func loadView() {
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

