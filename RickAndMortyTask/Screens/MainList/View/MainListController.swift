//
//  ViewController.swift
//  RickAndMortyTask
//
//  Created by APPLE on 18.08.2023.
//

import UIKit

protocol MainListViewProtocol: AnyObject {
    
    func success(model: [ModelMainListCell])
    
    func failure(error: Error)
    
    func controlActivityIndicator(indicator: LoadingIndicator)
}

final class MainListController: UIViewController {
    
    //MARK: - Properties
    private let compositionalLayout = CompositionalLayout()
    
    private var dataSource: UICollectionViewDiffableDataSource<SectionType, AnyHashable>?
    
    private let presenter: MainListPresenterProtocol
    
    fileprivate var mainView: MainListView {
        guard let view = self.view as? MainListView else {
            return MainListView()
        }
        return view
    }
    
    private var mainList: [ModelMainListCell] = []
    
    private let mainTitle = "Characters"
    
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
        configureNavigationBar()
        prepareCollectionView()
        createDataSource()
        reloadData(with: mainList)
        presenter.viewDidLoad()
        mainView.configure(with: ModelMainListView())
    }

    //MARK: - Configure view components
    private func configureNavigationBar() {
        let titleLabel = UILabel()
        titleLabel.text = mainTitle
        titleLabel.font = Fonts.mainTitle
        titleLabel.textColor = .white
                
        setupNavigationBar(leftItem: UIBarButtonItem(customView: titleLabel), rightItem: nil, titleView: nil)
    }
    
    private func prepareCollectionView() {
        mainView.collectionView.collectionViewLayout = createCompositionalLayout()
        mainView.collectionView.register(MainListCell.self, forCellWithReuseIdentifier: MainListCell.identifire)
        mainView.collectionView.contentInset = UIEdgeInsets(top: ProjectDesign.indentMain.top,
                                                            left: ProjectDesign.indentMain.left,
                                                            bottom: ProjectDesign.indentMain.bottom,
                                                            right: ProjectDesign.indentMain.right)
        mainView.collectionView.delegate = self
    }
    
    //MARK: Data source
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionType, AnyHashable>(collectionView: mainView.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            guard let section = SectionType(rawValue: indexPath.section) else { return UICollectionViewCell()}
            
            switch section {
            case .mainList:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainListCell.identifire, for: indexPath) as? MainListCell else {
                    return UICollectionViewCell()
                }
                cell.configure(with: self.mainList[indexPath.row])
                return cell
            }
        })
    }
    
    private func reloadData(with model: [ModelMainListCell]) {
        
        var snapshot = NSDiffableDataSourceSnapshot<SectionType, AnyHashable>()
        snapshot.appendSections([.mainList])
        snapshot.appendItems(model, toSection: .mainList)
       
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    //MARK: - Compositional layout
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let section = SectionType(rawValue: sectionIndex)
            
            switch section {
            case .mainList:
                return self.compositionalLayout.setProductFlowLayout()
            case .none:
                return nil
            }
        }
        return layout
    }

}
extension MainListController: MainListViewProtocol {

    func success(model: [ModelMainListCell]) {
        mainList.append(contentsOf: model)
        reloadData(with: mainList)
    }
    
    func failure(error: Error) {
        
    }
    
    func controlActivityIndicator(indicator: LoadingIndicator) {
        switch indicator {
        case .main(let state):
            mainView.mainActivityIndicator.controlActivityIndicator(state: state)
            
        case .paging(let state):
            mainView.pagingActivityIndicator.controlActivityIndicator(state: state)
        }
    }
}
extension MainListController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.showDetailsAboutHero(id: mainList[indexPath.row].id)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.row == mainList.count - 2 {
            presenter.supplement()
        }
    }
}
