//
//  NetworkManager.swift
//  RickAndMortyTask
//
//  Created by APPLE on 18.08.2023.
//

import UIKit

protocol NetworkManagerProtocol {
    
    func fetchModels<T: Decodable>(from url: URL?, in completion: @escaping ((Result<T, Error>) -> Void))
}

final class NetworkManager: NetworkManagerProtocol {
        
    public func fetchModels<T: Decodable>(from url: URL?, in completion: @escaping ((Result<T, Error>) -> Void)) {
        
        guard let url else {
            completion(.failure(NetworkManagerError.urlIsNil))
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
            }
            
            guard let data = data else {
                print(error?.localizedDescription ?? "No description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(T.self, from: data)
                completion(.success(model))
            }
            catch {
                completion(.failure(error))
                print("decode error: \(error)")
            }
        }.resume()
    }
}
