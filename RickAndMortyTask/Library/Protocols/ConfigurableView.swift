//
//  ConfigurableView.swift
//  RickAndMortyTask
//
//  Created by APPLE on 18.08.2023.
//

import Foundation

protocol ConfigurableView {
    
    associatedtype Model
    
    func configure(with model: Model)
}
