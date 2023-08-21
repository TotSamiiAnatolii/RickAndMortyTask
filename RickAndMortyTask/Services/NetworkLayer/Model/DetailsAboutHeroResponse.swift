//
//  DetailsAboutHero.swift
//  RickAndMortyTask
//
//  Created by APPLE on 20.08.2023.
//

import Foundation

struct DetailsAboutHeroDTO {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [EpisodeDTO]
}

struct EpisodeDTO {
    let id: Int
    let name: String
    let episode: String
    let created: String
}

// MARK: - DetailsAboutHero
struct DetailsAboutHeroResponse: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}
