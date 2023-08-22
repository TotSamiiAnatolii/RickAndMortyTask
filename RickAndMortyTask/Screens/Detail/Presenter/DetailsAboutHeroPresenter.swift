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
    
    func viewDidLoad()
    
    func setViewState(stateView: StateDetailView)
}

final class DetailsAboutHeroPresenter: DetailsAboutHeroPresenterProtocol {
    
    private var router: RouterProtocol
    
    private let rickAndMortyAPIManager: RickAndMortyManagerProtocol
    
    weak var view: DetailsAboutHeroViewProtocol?
    
    private let mapper = DetailsHeroMapper()

    private let parser = Parser()
    
    private var stateView: StateDetailView = .loading  {
        didSet {
            DispatchQueue.main.async {
                self.setViewState(stateView: self.stateView)
            }
        }
    }
    
    init(id: Int, rickAndMortyAPIManager: RickAndMortyManagerProtocol, router: RouterProtocol) {
        self.rickAndMortyAPIManager = rickAndMortyAPIManager
        self.router = router
        getDetailsAboutHero(id: id)
    }
    
    func viewDidLoad() {
        setViewState(stateView: stateView)
    }
    
    func popToRoot() {
        router.popToRoot()
    }
    
    func getDetailsAboutHero(id: Int) {
        rickAndMortyAPIManager.getFullDetailsAboutHero(id: id) { result in
            switch result {
            case .success(let hero):
                DispatchQueue.main.async {
                    self.stateView = .populated(self.mapper.map(model: hero))
                }
            case .failure(let failure):
                DispatchQueue.main.async {
                    self.stateView = .error(failure)
                }
            }
        }
    }
    
    func setViewState(stateView: StateDetailView) {
        switch stateView {
        case .loading:
            view?.controlActivityIndicator(indicator: .main(.startAnimating))
        case .populated(let detailHero):
            view?.success(model: detailHero)
            view?.controlActivityIndicator(indicator: .main(.stopAnimating))
        case .error(let error):
            view?.failure(error: error)
        }
    }
}
