//
//  OriginCell.swift
//  RickAndMortyTask
//
//  Created by APPLE on 19.08.2023.
//

import UIKit

final class OriginCell: UITableViewCell, CornerRadiusConfigurable {
    
    static let identifire = "OriginCell"
    
    private let earthLabel: UILabel = UILabel()
        .setMyStyle(numberOfLines: 1,
                    textAlignment: .justified,
                    font: Fonts.earth)
        .setTextColor(color: Colors.nameHero)
    
    private let planetLabel: UILabel = UILabel()
        .setMyStyle(numberOfLines: 1,
                    textAlignment: .left,
                    font: Fonts.planet)
        .setTextColor(color: Colors.planet)
    
    private let containerView = UIView()
        .setStyle()
        .setColor(color: Colors.containerPlanet)
        .setRoundCorners(radius: ProjectDesign.photoHeroCorner)
    
    private let planetImageView = UIImageView()
        .setMyStyle(corner: ProjectDesign.photoHeroCorner)
        .setImage(image: Images.planet)
    
    private let planetStack = UIStackView()
        .myStyleStack(spacing: 5,
                      alignment: .fill,
                      axis: .vertical,
                      distribution: .fillProportionally,
                      userInteraction: false)
        .setLayoutMargins(top: 8, left: .zero, bottom: 8, right: .zero)
    
    private let mainStack = UIStackView()
        .myStyleStack(spacing: 15,
                      alignment: .fill,
                      axis: .horizontal,
                      distribution: .fillProportionally,
                      userInteraction: false)
        .setLayoutMargins(top: 8, left: 8, bottom: 8, right: 8)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureVeiw()
        setViewHierarhies()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureVeiw() {
        contentView.backgroundColor = Colors.backgroundCell
        backgroundColor = Colors.mainBackground
        selectionStyle = .none
    }
    
    private func setViewHierarhies() {
        containerView.addSubview(planetImageView)
        planetStack.addArrangedSubview(earthLabel)
        planetStack.addArrangedSubview(planetLabel)
        mainStack.addArrangedSubview(containerView)
        mainStack.addArrangedSubview(planetStack)
        contentView.addSubview(mainStack)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStack.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            mainStack.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalToConstant: 64),
            containerView.heightAnchor.constraint(equalToConstant: 64)
        ])
        
        NSLayoutConstraint.activate([
            planetImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            planetImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            planetImageView.widthAnchor.constraint(equalToConstant: 24),
            planetImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func setRoundCorner(state: RoundCornerCell, radius: CGFloat) {
        contentView.roundCorners(state.rawValue, radius: radius)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.roundCorners(.allCorners, radius: 0.0)
    }
}
extension OriginCell: ConfigurableView {
    func configure(with model: ModelOriginCell) {
        earthLabel.text = model.name
        planetLabel.text = model.planet
    }
    
    typealias Model = ModelOriginCell
}
