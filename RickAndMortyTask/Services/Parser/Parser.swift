//
//  Parser.swift
//  RickAndMortyTask
//
//  Created by APPLE on 20.08.2023.
//

import Foundation

protocol ParserProtocol {
    
    func parseSesonAndEpisode(data: String) -> (season: String, episode: String)
    
}

final class Parser: ParserProtocol {
    
    func parseSesonAndEpisode(data: String) -> (season: String, episode: String) {
        
        let dataList = String(data.dropFirst())
            .components(separatedBy: "E")
            .map{ data in
                guard let int = Int(data) else {
                    return ""
                }
                return String(int)
            }
        return ("Season: \(dataList[0])", "Episode: \(dataList[1])")
    }
}
