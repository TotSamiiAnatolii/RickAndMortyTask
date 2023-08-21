//
//  ModelView.swift
//  RickAndMortyTask
//
//  Created by APPLE on 18.08.2023.
//

import Foundation

enum SectionType: Int {
    case mainList
}

enum StateViewModel {
    
    case loading
    case paging
    case populated([ModelMainListCell])
    case empty
    case error(Error)
}

enum StateLoadingIndicator {
    case startAnimating
    case stopAnimating
}

enum LoadingIndicator {
    case main(StateLoadingIndicator)
    case paging(StateLoadingIndicator)
}

struct ModelMainListView {
    
}
