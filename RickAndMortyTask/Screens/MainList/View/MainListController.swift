//
//  ViewController.swift
//  RickAndMortyTask
//
//  Created by APPLE on 18.08.2023.
//

import UIKit

protocol MainListViewProtocol: AnyObject {
    
    func succes()
    
    func error()
}

final class MainListController: UIViewController {
    
    private let presenter: MainListPresenterProtocol
    
    fileprivate var mainView: MainListView {
        guard let view = self.view as? MainListView else {
            return MainListView()
        }
        return view
    }
    
    //MARK: - Init
    init(presenter: MainListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = MainListView(frame: UIScreen.main.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }


}
extension MainListController: MainListViewProtocol {

    func succes() {
        
    }
    
    func error() {
        
    }
}
