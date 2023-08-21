//
//  MainListPresenter.swift
//  RickAndMortyTask
//
//  Created by APPLE on 18.08.2023.
//

import Foundation

protocol MainListPresenterProtocol {
    
    init(rickAndMortyAPIManager: RickAndMortyManagerProtocol, router: RouterProtocol)
    
    func viewDidLoad()
    
    func getMainList(page: Int)
    
    func supplement()
    
    func showDetailsAboutHero(id: Int)
}

final class MainListPresenter: MainListPresenterProtocol {
    
    private var router: RouterProtocol
    
    private let rickAndMortyAPIManager: RickAndMortyManagerProtocol
    
    weak var view: MainListViewProtocol?
    
    private let mapper = Mapper()
    
    internal let startNumberPagin = 1
    
    private lazy var pagingFile = PagingFile(currentPage: startNumberPagin)
    
    private var stateView: StateViewModel = .loading  {
        didSet {
            DispatchQueue.main.async {
                self.setViewState(stateView: self.stateView)
            }
        }
    }
    
    init(rickAndMortyAPIManager: RickAndMortyManagerProtocol, router: RouterProtocol) {
        self.router = router
        self.rickAndMortyAPIManager = rickAndMortyAPIManager
    }
    
    func viewDidLoad() {
        getMainList(page: startNumberPagin)
    }
    
    func getMainList(page: Int) {
        
        rickAndMortyAPIManager.getMainList(page: page) { result in
            switch result {
            case .success(let success):
                self.pagingFile.pageCount = success.info.count
                self.stateView = .populated(self.mapper.map(model: success.results))
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func supplement() {
        stateView = .paging
        pagingFile.hasMorePages ? getMainList(page: pagingFile.nextPage()) : view?.controlActivityIndicator(indicator: .paging(.stopAnimating))
    }
    
    func showDetailsAboutHero(id: Int) {
        router.showDetailsAboutHero(id: id)
    }
    
    func setViewState(stateView: StateViewModel) {
        switch stateView {
        case .loading:
            view?.controlActivityIndicator(indicator: .main(.startAnimating))
        case .paging:
            view?.controlActivityIndicator(indicator: .paging(.startAnimating))
        case .populated(let listHeroes):
            view?.success(model: listHeroes)
            view?.controlActivityIndicator(indicator: .main(.stopAnimating))
            view?.controlActivityIndicator(indicator: .paging(.stopAnimating))
        case .empty:
            view?.success(model: [])
        case .error(let error):
            view?.failure(error: error)
        }
    }
}
