//
//  ModelDetailsAboutHero.swift
//  RickAndMortyTask
//
//  Created by APPLE on 19.08.2023.
//

import UIKit

struct ModelDetailsAboutHero {
    let header: ModelMainHeader?
    let sections: [TypeDataSection]
}

struct TypeDataSection {
    let title: String
    let rows: [TypeDataRow]
    
    init(_ title: String, rows: [TypeDataRow]) {
        self.title = title
        self.rows = rows
    }
}

enum TypeDataRow {
    
    enum Corners {
        case auto
        case full
    }
    
    case info(ModelInfoCell, Corners)
    case origin(ModelOriginCell, Corners)
    case episode(ModelEpisodesCell, Corners)
}

extension TypeDataRow {
    
    var rowHeight: CGFloat {
        switch self {
        case .info:
            return 42
        case .origin:
            return 80
        case .episode:
            return 105
        }
    }
}

enum RoundCornerCell {
    
    case full
    case top
    case bottom
    case none
}

extension RoundCornerCell: RawRepresentable {
    
    typealias RawValue = UIRectCorner
    
    init?(rawValue: RawValue) {
        switch rawValue {
        case [.topLeft, .topRight, .bottomLeft, .bottomRight]: self = .full
        case [.topLeft, .topRight]: self = .top
        case [.bottomLeft, .bottomRight]: self = .bottom
        default: return nil
        }
    }
    
    var rawValue: RawValue {
        switch self {
        case .full: return [.topLeft, .topRight, .bottomLeft, .bottomRight]
        case .top: return [.topLeft, .topRight]
        case .bottom: return [.bottomLeft, .bottomRight]
        case .none: return []
        }
    }
}
