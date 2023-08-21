//
//  UIViewController+.swift
//  RickAndMortyTask
//
//  Created by APPLE on 19.08.2023.
//

import UIKit

extension UIViewController {
    
    func setupNavigationBar(leftItem: UIBarButtonItem?, rightItem: UIBarButtonItem?, titleView: UIView?) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = Colors.mainBackground

        appearance.setBackIndicatorImage(
            Images.backButton,
            transitionMaskImage: Images.backButton
        )
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        
        navigationItem.backButtonTitle = ""
        
        navigationItem.leftBarButtonItem = leftItem
        navigationItem.rightBarButtonItem = rightItem
        navigationItem.titleView = titleView
        
        navigationController?.navigationBar.tintColor = .white
    }
}
