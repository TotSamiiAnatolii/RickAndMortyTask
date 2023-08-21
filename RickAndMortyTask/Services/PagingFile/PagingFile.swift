//
//  PagingFile.swift
//  RickAndMortyTask
//
//  Created by APPLE on 19.08.2023.
//

import Foundation

protocol PagingFileProtocol {
    
    init(currentPage: Int)
    var pageCount: Int {get set}
    var currentPage: Int {get set}
    var hasMorePages: Bool {get}
    func nextPage() -> Int
}

final class PagingFile: PagingFileProtocol {
    
    init(currentPage: Int) {
        self.currentPage = currentPage
    }
    
    var pageCount: Int = 0
    
    var currentPage: Int
    
    var hasMorePages: Bool {
        return currentPage < pageCount
    }
    
    func nextPage() -> Int {
        switch hasMorePages {
        case true:
            currentPage += 1
            return currentPage
        case false:
            return currentPage
        }
    } 
}
