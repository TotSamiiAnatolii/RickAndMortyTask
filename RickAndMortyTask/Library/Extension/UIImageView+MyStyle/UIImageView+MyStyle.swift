//
//  UIImageView+MyStyle.swift
//  RickAndMortyTask
//
//  Created by APPLE on 19.08.2023.
//

import UIKit

extension UIImageView {
    
    public func setMyStyle(corner: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFill
        layer.cornerRadius = corner
        clipsToBounds = true
        return self
    }
    
    public func setImage(image: UIImage?) -> Self {
        self.image = image
        return self
    }
    
    public func setTintColor(color: UIColor) -> Self {
        tintColor = color
        return self
    }
}
