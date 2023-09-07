//
//  NetworkManagerError.swift
//  RickAndMortyTask
//
//  Created by APPLE on 07.09.2023.
//

import Foundation

enum NetworkManagerError: Error {
    
    case urlIsNil
}

enum ErrorTypes: String {
    case warning = "Warning"
    case internetConnection = "Please check your internet connection or try again later."
}
