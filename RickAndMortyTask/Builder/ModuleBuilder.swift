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
    
    let rickAndMortyAPIManager: RickAndMortyManagerProtocol
    
    init(rickAndMortyAPIManager: RickAndMortyManagerProtocol) {
        self.rickAndMortyAPIManager = rickAndMortyAPIManager
    }

    func createMainList(router: RouterProtocol) -> UIViewController {
        let presnter = MainListPresenter(rickAndMortyAPIManager: rickAndMortyAPIManager, router: router)
        let view = MainListController(presenter: presnter)
        presnter.view = view
        return view
    }
    
    func createDetailsAboutHero(id: Int, router: RouterProtocol) -> UIViewController {
        let presenter = DetailsAboutHeroPresenter(id: id, rickAndMortyAPIManager: rickAndMortyAPIManager, router: router)
        let view = DetailsAboutHeroController(presenter: presenter)
        presenter.view = view
        return view
    }
}
