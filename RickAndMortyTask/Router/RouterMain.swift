//
//  RouterMain.swift
//  RickAndMortyTask
//
//  Created by APPLE on 18.08.2023.
//

import UIKit

protocol RouterMain {
    
    var navigationController: UINavigationController { get set }
    var assemblyBuilder: AssemblyBuilderProtocol { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetailsAboutHero(id: Int)
    func popToRoot()
    func alert(title: String, message: String, btnTitle: String, action: @escaping (() -> Void))
}

final class Router: RouterProtocol {
    
    var navigationController: UINavigationController
    
    var assemblyBuilder: AssemblyBuilderProtocol
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        let mainList = assemblyBuilder.createMainList(router: self)
        navigationController.viewControllers = [mainList]
    }
    
    func showDetailsAboutHero(id: Int) {
        let detailsAboutHeroVC = assemblyBuilder.createDetailsAboutHero(id: id, router: self)
        navigationController.pushViewController(detailsAboutHeroVC, animated: true)
    }
    
    func popToRoot() {
        navigationController.popViewController(animated: true)
    }
    
    func alert(title: String, message: String, btnTitle: String, action: @escaping (() -> Void)) {
        let alertController = assemblyBuilder.createAlert(
            title: title,
            message: message,
            btnTitle: btnTitle,
            action: action)
        navigationController.present(alertController, animated: true)
    }
}
