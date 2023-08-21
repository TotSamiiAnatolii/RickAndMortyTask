//
//  UIActivityIndicatorView+.swift
//  RickAndMortyTask
//
//  Created by APPLE on 19.08.2023.
//

import UIKit

extension UIActivityIndicatorView {
    
    func setStyleIndicator() -> Self {
        self.isHidden = true
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    func controlActivityIndicator(state: StateLoadingIndicator) {
        switch state {
        case .startAnimating:
            self.isHidden = false
            self.startAnimating()
        case .stopAnimating:
            self.isHidden = true
            self.stopAnimating()
        }
    }
}
