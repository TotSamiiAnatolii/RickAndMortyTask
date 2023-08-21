//
//  EpisodesCell.swift
//  RickAndMortyTask
//
//  Created by APPLE on 19.08.2023.
//

import UIKit

final class EpisodesCell: UITableViewCell, CornerRadiusConfigurable {

    static let identifire = "EpisodesCell"
    
    private let nameLabel: UILabel = UILabel()
        .setMyStyle(numberOfLines: 1,
                    textAlignment: .left,
                    font: Fonts.earth)
        .setTextColor(color: Colors.nameHero)
    
    private let episodeLabel: UILabel = UILabel()
        .setMyStyle(numberOfLines: 1,
                    textAlignment: .left,
                    font: Fonts.planet)
        .setTextColor(color: Colors.planet)
    
    private let dateLabel: UILabel = UILabel()
        .setMyStyle(numberOfLines: 1,
                    textAlignment: .right,
                    font: Fonts.date)
        .setTextColor(color: Colors.date)
    
    private let containerView = UIView()
        .setStyle()
        .setColor(color: Colors.backgroundCell)
    
    private let episodeDateStack = UIStackView()
        .myStyleStack(spacing: 5,
                      alignment: .fill,
                      axis: .horizontal,
                      distribution: .fillProportionally,
                      userInteraction: false)
    
    private let mainStack = UIStackView()
        .myStyleStack(spacing: 15,
                      alignment: .fill,
                      axis: .vertical,
                      distribution: .fillProportionally,
                      userInteraction: false)
        .setLayoutMargins(top: 14, left: 14, bottom: 14, right: 14)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureVeiw()
        setViewHierarhies()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        episodeLabel.text = nil
        dateLabel.text = nil
    }
    
    private func configureVeiw() {
        contentView.backgroundColor = Colors.mainBackground
    }
    
    private func setViewHierarhies() {
        episodeDateStack.addArrangedSubview(episodeLabel)
        episodeDateStack.addArrangedSubview(dateLabel)
        mainStack.addArrangedSubview(nameLabel)
        mainStack.addArrangedSubview(episodeDateStack)
        containerView.addSubview(mainStack)
        contentView.addSubview(containerView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            containerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.85),
            containerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: containerView.topAnchor),
            mainStack.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            mainStack.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            mainStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    public func setRoundCorner(state: RoundCornerCell, radius: CGFloat) {
        containerView.roundCorners(state.rawValue, radius: radius)
    }
}
extension EpisodesCell: ConfigurableView {
    func configure(with model: ModelEpisodesCell) {
        nameLabel.text = model.name
        episodeLabel.text = model.episode + " " + model.season
        dateLabel.text = model.date
    }
    
    
    typealias Model = ModelEpisodesCell
}
