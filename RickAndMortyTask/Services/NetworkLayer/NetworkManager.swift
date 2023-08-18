//
//  NetworkManager.swift
//  RickAndMortyTask
//
//  Created by APPLE on 18.08.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    
    func getList(completion: @escaping (() -> Void))
    
    func getDetail(id: String, completion: @escaping (() -> Void))
    
}

final class NetworkManager: NetworkServiceProtocol {
    
    func getList(completion: @escaping (() -> Void)) {
        
    }
    
    func getDetail(id: String, completion: @escaping (() -> Void)) {
        
    }
}
