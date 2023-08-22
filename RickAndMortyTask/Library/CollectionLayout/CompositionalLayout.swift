//
//  CompositionalLayout.swift
//  RickAndMortyTask
//
//  Created by APPLE on 18.08.2023.
//

import UIKit

final class CompositionalLayout {
    
    func setCharactersFlowLayout() -> NSCollectionLayoutSection {
        let itemsSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .absolute(200))
       
       let items = NSCollectionLayoutItem(layoutSize: itemsSize)
        
        items.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        let groupsSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
       
       let groups = NSCollectionLayoutGroup.horizontal(layoutSize: groupsSize, subitem: items, count: 2)
       
       let section = NSCollectionLayoutSection(group: groups)
        
       section.interGroupSpacing = 14
       
       section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 10, bottom: 0, trailing: 10)
       
       return section
    }
}
