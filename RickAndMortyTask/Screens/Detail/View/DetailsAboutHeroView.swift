//
//  DetailsAboutHeroView.swift
//  RickAndMortyTask
//
//  Created by APPLE on 19.08.2023.
//

import UIKit

final class DetailsAboutHeroView: UIView {
    
    var tableView: UITableView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureVeiw()
        setupTableView()
        setViewHierarhies()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureVeiw() {
        backgroundColor = Colors.mainBackground
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = Colors.mainBackground
        tableView.register(InfoCell.self, forCellReuseIdentifier: InfoCell.identifire)
        tableView.register(OriginCell.self, forCellReuseIdentifier: OriginCell.identifire)
        tableView.register(EpisodesCell.self, forCellReuseIdentifier: EpisodesCell.identifire)
    }
    
    private func setViewHierarhies() {
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
