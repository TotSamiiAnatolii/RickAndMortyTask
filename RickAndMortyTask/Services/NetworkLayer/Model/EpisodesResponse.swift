//
//  EpisodesResponse.swift
//  RickAndMortyTask
//
//  Created by APPLE on 20.08.2023.
//

import Foundation

struct EpisodesDTO {
    let episodes: [EpisodesResponse]
}

// MARK: - EpisodesResponse
struct EpisodesResponse: Codable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}
