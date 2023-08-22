//
//  RickAndMortyManager.swift
//  RickAndMortyTask
//
//  Created by APPLE on 21.08.2023.
//

import Foundation

protocol RickAndMortyManagerProtocol {
    
    func getMainList(page: Int, completion: @escaping ((Result<RickAndMortyList, Error>) -> Void))
    
    func getDetailsAboutHero(id: Int, completion: @escaping ((Result<DetailsAboutHeroResponse, Error>) -> Void))
    
    func getEpisode(url: String, completion: @escaping ((Result<EpisodesResponse, Error>) -> Void))
    
    func getFullDetailsAboutHero(id: Int, completion: @escaping ((Result<DetailsAboutHeroDTO, Error>) -> Void))

}

final class RickAndMortyManager: RickAndMortyManagerProtocol {
    
    private let networkManager: NetworkManagerProtocol
    
    private let mapper = RickAndMortyManagerMapper()
    
    public init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    func getFullDetailsAboutHero(id: Int, completion: @escaping ((Result<DetailsAboutHeroDTO, Error>) -> Void)) {
        DispatchQueue.global(qos: .default).async {
            self.getDetailsAboutHero(id: id) { result in
                switch result {
                case .success(let hero):
                    var resultItems = [EpisodeDTO?](repeating: nil, count: hero.episode.count)
                    
                    let group = DispatchGroup()
                    
                    for (index, episodeURLString) in zip(hero.episode.indices, hero.episode) {
                        group.enter()
                        self.getEpisode(url: episodeURLString) { result in
                            defer {
                                group.leave()
                            }
                            
                            switch result {
                            case .success(let episode):
                                resultItems[index] = self.mapper.map(model: episode)
                                
                            case .failure(let failure):
                                print(failure)
                            }
                        }
                    }
                    
                    group.notify(queue: DispatchQueue.global(qos: .default)) {
                        completion(.success(self.mapper.mapDTOModel(model: hero, episodes: resultItems)))
                    }
                case .failure(let failure):
                    print(failure)
                    completion(.failure(failure))
                }
            }
        }
    }
  
    // MARK: - Base requests
    func getMainList(page: Int, completion: @escaping((Result<RickAndMortyList, Error>) -> Void)) {
        networkManager.fetchModels(
            from: APIBuilder.character(page: page),
            in: completion
        )
    }
    
    func getDetailsAboutHero(id: Int, completion: @escaping ((Result<DetailsAboutHeroResponse, Error>) -> Void)) {
        networkManager.fetchModels(
            from: APIBuilder.deateilsAboutHero(id: id),
            in: completion
        )
    }
    
    func getEpisode(url: String, completion: @escaping ((Result<EpisodesResponse, Error>) -> Void)) {
        networkManager.fetchModels(
            from: URL(string: url),
            in: completion
        )
    }
}
