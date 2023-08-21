//
//  InfoCell.swift
//  RickAndMortyTask
//
//  Created by APPLE on 19.08.2023.
//

import UIKit

final class InfoCell: UITableViewCell, CornerRadiusConfigurable {

    static let identifire = "InfoCell"
    
    private let typeLabel: UILabel = UILabel()
        .setMyStyle(numberOfLines: 1,
                    textAlignment: .left,
                    font: Fonts.infoTypeCell)
        .setTextColor(color: Colors.infoTypeCell)
    
    private let valueLabel: UILabel = UILabel()
        .setMyStyle(numberOfLines: 1,
                    textAlignment: .left,
                    font: Fonts.infoValueCell)
        .setTextColor(color: Colors.nameHero)
        
    
    private let mainStack = UIStackView()
        .myStyleStack(spacing: 1,
                      alignment: .top,
                      axis: .horizontal,
                      distribution: .equalSpacing,
                      userInteraction: false)
    
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
        contentView.addSubview(mainStack)
        mainStack.addArrangedSubview(typeLabel)
        mainStack.addArrangedSubview(valueLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStack.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            mainStack.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
 
    public func setRoundCorner(state: RoundCornerCell, radius: CGFloat) {
        contentView.roundCorners(state.rawValue, radius: radius)
        switch state {
        case .full:
            mainStack.setLayoutMargins1(top: 12, left: 20, bottom: 12, right: 20)
        case .top:
            mainStack.setLayoutMargins1(top: 16, left: 20, bottom: 8, right: 20)
        case .bottom:
            mainStack.setLayoutMargins1(top: 8, left: 20, bottom: 16, right: 20)
        case .none:
            mainStack.setLayoutMargins1(top: 12, left: 20, bottom: 12, right: 20)
        }
    }
}
extension InfoCell: ConfigurableView {
    func configure(with model: ModelInfoCell) {
        typeLabel.text = model.type
        valueLabel.text = model.value
    }
    
    typealias Model = ModelInfoCell
}


protocol CornerRadiusConfigurable {
    
    func setRoundCorner(state: RoundCornerCell, radius: CGFloat)
}
