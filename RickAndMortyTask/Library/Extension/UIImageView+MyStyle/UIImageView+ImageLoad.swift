//
//  UIImageView+ImageLoader.swift
//  RickAndMortyTask
//
//  Created by APPLE on 19.08.2023.
//

import UIKit

var imageCashe = NSCache<AnyObject, AnyObject>()

extension UIImageView {

    func loadImage(urlString: String) {
        
        let urlHash = UUID().hashValue
        tag = urlHash
        
        ImageDownloader.shared.getImage(for: urlString, completion: { data in
            
            DispatchQueue.global(qos: .userInitiated).async {
                let image = data
                DispatchQueue.main.async {
                    guard self.tag == urlHash else {
                        return
                    }
                    self.image = image
                }
            }
        }, useCash: false)
    }
}
