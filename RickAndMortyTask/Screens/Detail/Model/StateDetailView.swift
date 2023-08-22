//
//  File.swift
//  RickAndMortyTask
//
//  Created by APPLE on 22.08.2023.
//

import Foundation

enum StateDetailView {
    case loading
    case populated(ModelDetailsAboutHero)
    case error(Error)
}
