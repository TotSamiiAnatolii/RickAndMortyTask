//
//  MainListCell.swift
//  RickAndMortyTask
//
//  Created by APPLE on 18.08.2023.
//

import UIKit

final class MainListCell: UICollectionViewCell {
    
    static let identifire = "MainListCell"
    
    private let nameHeroLabel: UILabel = UILabel()
        .setMyStyle(numberOfLines: 2,
                    textAlignment: .center,
                    font: Fonts.nameHero)
        .setTextColor(color: Colors.nameHero)
    
    private let photoHeroImageView = UIImageView()
        .setMyStyle(corner: ProjectDesign.photoHeroCorner)
    
    private let mainStack = UIStackView()
        .myStyleStack(spacing: 3,
                      alignment: .center,
                      axis: .vertical,
                      distribution: .fill,
                      userInteraction: false)
        .setLayoutMargins(top: ProjectDesign.indentMainCell.top,
                          left: ProjectDesign.indentMainCell.left,
                          bottom: ProjectDesign.indentMainCell.bottom,
                          right: ProjectDesign.indentMainCell.right)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureVeiw()
        setViewHierarhies()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            isHighlighted ? touchDown() : touchUp()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCornerRadiusCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoHeroImageView.image = nil
        nameHeroLabel.text = nil
    }
    
    private func setViewHierarhies() {
        mainStack.addArrangedSubview(photoHeroImageView)
        mainStack.addArrangedSubview(nameHeroLabel)
        contentView.addSubview(mainStack)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            photoHeroImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7)
        ])
    }
    
    private func configureVeiw() {
        contentView.backgroundColor = Colors.backgroundCell
    }
    
    private func setupCornerRadiusCell() {
        contentView.layer.cornerRadius = ProjectDesign.mainListCorner
        contentView.clipsToBounds = true
    }
    
    private func touchDown() {
        let scaleX = 0.98
        let scaleY = 0.98
        
        transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
    }
    
    private func  touchUp() {
        let scaleX = 1.0
        let scaleY = 1.0
        
        UIView.animateKeyframes(withDuration: 0.4,
                                delay: 0,
                                options: [.beginFromCurrentState,
                                          .allowUserInteraction],
                                animations: {
            
            self.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        })
    }
}
extension MainListCell: ConfigurableView {
    func configure(with model: ModelMainListCell) {
        nameHeroLabel.text = model.nameHeroes
        photoHeroImageView.loadImage(urlString: model.photoHeroes)
    }
    
    typealias Model = ModelMainListCell
}
