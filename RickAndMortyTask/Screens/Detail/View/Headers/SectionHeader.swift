//
//  SectionHeader.swift
//  RickAndMortyTask
//
//  Created by APPLE on 19.08.2023.
//

import UIKit

final class SectionHeader: UIView {
    
    private let titleLabel = UILabel()
        .setMyStyle(
            numberOfLines: 1,
            textAlignment: .left,
            font: Fonts.headerDetailsAboutHero)
        .setTextColor(color: .white)

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
        self.addSubview(titleLabel)
    }
    
    private func setupConstaints() {
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
extension SectionHeader: ConfigurableView {
    
    typealias Model = ModelHeader
    
    func configure(with model: ModelHeader) {
        titleLabel.text = model.title
    }
}
