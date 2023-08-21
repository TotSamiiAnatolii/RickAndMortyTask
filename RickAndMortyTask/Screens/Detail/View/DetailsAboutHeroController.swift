//
//  DetailsAboutHeroController.swift
//  RickAndMortyTask
//
//  Created by APPLE on 19.08.2023.
//

import UIKit

protocol DetailsAboutHeroViewProtocol: AnyObject {
    
    func success(model: ModelDetailsAboutHero)
    
    func failure(error: Error)
}

final class DetailsAboutHeroController: UIViewController {
    
    //MARK: Property
    private let presenter: DetailsAboutHeroPresenterProtocol
        
    private let heightForHeaderInSection: CGFloat = 60
   
    private var model: ModelDetailsAboutHero = ModelDetailsAboutHero(header: nil, sections: [])
    
    fileprivate var detailView: DetailsAboutHeroView {
        guard let view = self.view as? DetailsAboutHeroView else {
            return DetailsAboutHeroView()
        }
        return view
    }
    
    init(presenter: DetailsAboutHeroPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = DetailsAboutHeroView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        prepareTableView()
    }
    
    private func prepareTableView() {
        detailView.tableView.delegate = self
        detailView.tableView.dataSource = self
        detailView.tableView.contentInset.top = 20
        
        let contentOffsetY = -detailView.tableView.contentInset.top
        detailView.tableView.setContentOffset(CGPoint(x: .zero, y: contentOffsetY), animated: false)
    }
    
    private func configureNavigationBar() {
        
        setupNavigationBar(leftItem: nil, rightItem: nil, titleView: nil)
    }
    
    @objc func backButton() {
        presenter.popToRoot()
    }
    
    private func roundСornersCells(indexPath: IndexPath, _ tableView: UITableView) -> RoundCornerCell {
        
        let lastCellinSection = tableView.numberOfRows(inSection: indexPath.section) - 1
        
        switch indexPath.row {
        case _ where indexPath.row == 0 && indexPath.row == lastCellinSection:
            return .full
            
        case _ where indexPath.row == 0:
            return .top
            
        case _ where indexPath.row == lastCellinSection:
            return .bottom
            
        default:
            return .none
        }
    }
}

extension DetailsAboutHeroController: DetailsAboutHeroViewProtocol {
    
    func success(model: ModelDetailsAboutHero) {
        self.model = model
        
        if let headerModel = self.model.header {
            if detailView.tableView.tableHeaderView == nil {
                let widhtHeader = view.frame.width
                let heightHeader: CGFloat = 230
                let header = MainHeader(frame: CGRect(x: 0, y: 0, width: widhtHeader, height: heightHeader))
                detailView.tableView.tableHeaderView = header
            }
            
            (detailView.tableView.tableHeaderView as? MainHeader)?.configure(with: headerModel)
        } else {
            detailView.tableView.tableHeaderView = nil
        }
        
        detailView.tableView.reloadData()
    }
    
    func failure(error: Error) {
        
    }
}
extension DetailsAboutHeroController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section < model.sections.count else { return 0 }
        
        return model.sections[section].rows.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard indexPath.section < model.sections.count,
              indexPath.row < model.sections[indexPath.section].rows.count
        else {
            return UITableViewCell()
        }
        
        let rowItem = model.sections[indexPath.section].rows[indexPath.row]
        
        switch rowItem {
        case let .info(model, _):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.identifire, for: indexPath) as? InfoCell else {
                return UITableViewCell()}
            cell.configure(with: model)
            return cell
            
        case let .origin(model, _):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: OriginCell.identifire, for: indexPath) as? OriginCell else {
                return UITableViewCell() }
            cell.configure(with: model)
            return cell
            
            
        case let .episode(model, _):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EpisodesCell.identifire, for: indexPath) as? EpisodesCell else {
                return UITableViewCell() }
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return heightForHeaderInSection
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section < model.sections.count else { return nil }
        
        let sectionItem = model.sections[section]
        
        let headerView = SectionHeader(frame: CGRect(x: .zero, y: .zero, width: tableView.frame.width, height: .zero))
        
        headerView.configure(with: ModelHeader(title: sectionItem.title))
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.section < model.sections.count,
              indexPath.row < model.sections[indexPath.section].rows.count
        else {
            return 0
        }
        
        return model.sections[indexPath.section].rows[indexPath.row].rowHeight
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard indexPath.section < model.sections.count,
              indexPath.row < model.sections[indexPath.section].rows.count
        else {
            return
        }
        
        let rowItem = model.sections[indexPath.section].rows[indexPath.row]

        guard let cell = cell as? CornerRadiusConfigurable else {
            return }
 
        switch rowItem {

        case .info(_, .full), .origin(_, .full), .episode(_, .full):
            cell.setRoundCorner(state: .full, radius: ProjectDesign.mainListCorner)

        case .info(_, .auto), .origin(_, .auto), .episode(_, .auto):
            cell.setRoundCorner(
                state: roundСornersCells(indexPath: indexPath, tableView),
                radius: ProjectDesign.mainListCorner
            )
        }
    }
}
