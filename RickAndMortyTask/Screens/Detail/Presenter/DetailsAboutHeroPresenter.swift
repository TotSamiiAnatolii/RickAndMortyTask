//
//  DetailsAboutHeroPresenter.swift
//  RickAndMortyTask
//
//  Created by APPLE on 19.08.2023.
//

import Foundation

protocol DetailsAboutHeroPresenterProtocol {
    
    init(id: Int, rickAndMortyAPIManager: RickAndMortyManagerProtocol, router: RouterProtocol)
    
    func popToRoot()
    
    func getDetailsAboutHero(id: Int)
}

final class DetailsAboutHeroPresenter: DetailsAboutHeroPresenterProtocol {
    
    private var router: RouterProtocol
    
    private let rickAndMortyAPIManager: RickAndMortyManagerProtocol
    
    weak var view: DetailsAboutHeroViewProtocol?
    
    private let mapper = DetailsHeroMapper()

    private let parser = Parser()
    
    init(id: Int, rickAndMortyAPIManager: RickAndMortyManagerProtocol, router: RouterProtocol) {
        self.rickAndMortyAPIManager = rickAndMortyAPIManager
        self.router = router
        getDetailsAboutHero(id: id)
    }
    
    func popToRoot() {
        router.popToRoot()
    }
    
    func getDetailsAboutHero(id: Int) {
        rickAndMortyAPIManager.getFullDetailsAboutHero(id: id) { result in
            switch result {
            case .success(let hero):
                DispatchQueue.main.async {
                    self.view?.success(model: self.mapper.map(model: hero))
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
