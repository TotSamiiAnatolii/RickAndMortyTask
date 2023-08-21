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
        
        tag = urlString.hashValue
        
        if let image = imageCashe.object(forKey: urlString as NSString) {
            self.image = image as? UIImage
            return
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        DispatchQueue.global(qos: .userInitiated).async{
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    
                    DispatchQueue.main.async {
                        imageCashe.setObject(image, forKey: urlString as NSString)
                        if self.tag == urlString.hashValue {
                            self.image = image
                        }
                    }
                }
            }
        }
    }
}
