//
//  MainListPresenter.swift
//  RickAndMortyTask
//
//  Created by APPLE on 18.08.2023.
//

import Foundation

protocol MainListPresenterProtocol {
    
    init(networkService: NetworkServiceProtocol, router: RouterProtocol)
}

final class MainListPresenter: MainListPresenterProtocol {
    
    private var router: RouterProtocol
    
    private let networkService: NetworkServiceProtocol
    
    weak var view: MainListViewProtocol?
    
    init(networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.router = router
        self.networkService = networkService
    }
    
    
    
}
