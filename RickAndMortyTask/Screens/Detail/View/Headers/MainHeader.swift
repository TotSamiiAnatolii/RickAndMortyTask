//
//  MainHeader.swift
//  RickAndMortyTask
//
//  Created by APPLE on 19.08.2023.
//

import UIKit

final class MainHeader: UIView {
    
    private let photoHeroImageView = UIImageView()
        .setMyStyle(corner: ProjectDesign.photoHeroCorner)
    
    private let nameHeroLabel = UILabel()
        .setMyStyle(
            numberOfLines: 1,
            textAlignment: .center,
            font: Fonts.nameHeroHeader)
        .setTextColor(color: .white)
    
    private let stateHeroLabel = UILabel()
        .setMyStyle(
            numberOfLines: 1,
            textAlignment: .center,
            font: Fonts.stateLife)
        .setTextColor(color: Colors.planet)
    
    private let descriptionStack = UIStackView()
        .myStyleStack(spacing: 5,
                      alignment: .center,
                      axis: .vertical,
                      distribution: .equalSpacing,
                      userInteraction: false)
    
    private let mainStack = UIStackView()
        .myStyleStack(spacing: 25,
                      alignment: .center,
                      axis: .vertical,
                      distribution: .equalSpacing,
                      userInteraction: false)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setViewHierarhies()
        setupConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = Colors.mainBackground
    }
    
    private func setViewHierarhies() {
        descriptionStack.addArrangedSubview(nameHeroLabel)
        descriptionStack.addArrangedSubview(stateHeroLabel)
        mainStack.addArrangedSubview(photoHeroImageView)
        mainStack.addArrangedSubview(descriptionStack)
        addSubview(mainStack)
    }
    
    private func setupConstaints() {
        
        NSLayoutConstraint.activate([
            photoHeroImageView.widthAnchor.constraint(equalToConstant: 148),
            photoHeroImageView.heightAnchor.constraint(equalToConstant: 148)
            
        ])
        
        NSLayoutConstraint.activate([
            mainStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
extension MainHeader: ConfigurableView {
    
    typealias Model = ModelMainHeader
    
    func configure(with model: Model) {
        nameHeroLabel.text = model.name
        stateHeroLabel.text = model.status
        photoHeroImageView.loadImage(urlString: model.poster)
    }
}
