//
//  CompositionalLayout.swift
//  RickAndMortyTask
//
//  Created by APPLE on 18.08.2023.
//

import UIKit

final class CompositionalLayout {
    
    func setMainListLayout() -> NSCollectionLayoutSection  {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 18)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.23), heightDimension: .absolute(100)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .continuous
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 15)
        
        return section
    }
    
    func setBannerFlowLayout() -> NSCollectionLayoutSection  {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .absolute(160)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .continuous
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10)
        
        return section
    }
    
    func setOfferFlowLayout() -> NSCollectionLayoutSection  {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 10)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.3), heightDimension: .absolute(140)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .continuous
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 10)
        
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(130)), elementKind:  UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        ]
        
        return section
    }
    
    func setProductFlowLayout() -> NSCollectionLayoutSection {
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
