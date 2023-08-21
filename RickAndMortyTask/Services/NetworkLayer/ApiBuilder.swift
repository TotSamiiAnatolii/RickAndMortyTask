//
//  ApiBuilder.swift
//  RickAndMortyTask
//
//  Created by APPLE on 19.08.2023.
//

import Foundation

enum APIBuilder {
    
    static func character(page: Int) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rickandmortyapi.com"
        components.path = "/api/character"
        
        components.queryItems = [
            URLQueryItem(name: "page", value: "\(page)")
        ]
        return components.url
    }
    
    static func deateilsAboutHero(id: Int) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rickandmortyapi.com"
        components.path = "/api/character/\(id)"
        
        return components.url
    }
}
