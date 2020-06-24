//
//  CodeView.swift
//  ViewCodePOC
//
//  Created by Tag Livros on 21/06/20.
//  Copyright © 2020 Tag Livros. All rights reserved.
//

import Foundation

protocol CodeViewProtocol {
    func buildViewHierarchi()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension CodeViewProtocol {
    func setupView() {
        buildViewHierarchi()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
