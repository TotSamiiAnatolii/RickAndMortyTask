//
//  MainListView.swift
//  RickAndMortyTask
//
//  Created by APPLE on 18.08.2023.
//

import UIKit

final class MainListView: UIView {
    
    public var collectionView: UICollectionView!
    
    let mainActivityIndicator = UIActivityIndicatorView()
        .setStyleIndicator()
    
    let pagingActivityIndicator = UIActivityIndicatorView()
        .setStyleIndicator()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.mainBackground
        setupCollectionView()
        setViewHierarhies()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup collectionView
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = Colors.mainBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
    }
    
    private func setViewHierarhies() {
        addSubview(collectionView)
        addSubview(mainActivityIndicator)
        addSubview(pagingActivityIndicator)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mainActivityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainActivityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            pagingActivityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pagingActivityIndicator.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}
extension MainListView: ConfigurableView {
    
    func configure(with model: ModelMainListView) {
     
    }
    
    typealias Model = ModelMainListView
}
