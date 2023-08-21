//
//  ModelRickAndMorty.swift
//  RickAndMortyTask
//
//  Created by APPLE on 19.08.2023.
//

import Foundation

// MARK: - RickAndMortyList
struct RickAndMortyList: Codable {
    let info: Info
    let results: [Heroes]
}

// MARK: - Info
struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String
}

// MARK: - Result
struct Heroes: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

