//
//  ModuleBuilder.swift
//  RickAndMortyTask
//
//  Created by APPLE on 18.08.2023.
//

import UIKit

protocol AssemblyBuilderProtocol {
    
    func createMainList(router: RouterProtocol) -> UIViewController
        
    func createDetailsAboutHero(id: Int, router: RouterProtocol) -> UIViewController
}

final class ModuleBuilder: AssemblyBuilderProtocol {
    
    let networkService: NetworkManager
    
    init(networkService: NetworkManager) {
        self.networkService = networkService
    }

    func createMainList(router: RouterProtocol) -> UIViewController {
        let presnter = MainListPresenter(networkService: networkService, router: router)
        let view = MainListController(presenter: presnter)
        presnter.view = view
        return view
    }
    
    func createDetailsAboutHero(id: Int, router: RouterProtocol) -> UIViewController {
        let presenter = DetailsAboutHeroPresenter(id: id, networkService: networkService, router: router)
        let view = DetailsAboutHeroController(presenter: presenter)
        presenter.view = view
        return view
    }
}
