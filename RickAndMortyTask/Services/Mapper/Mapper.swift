//
//  Mapper.swift
//  RickAndMortyTask
//
//  Created by APPLE on 19.08.2023.
//

import Foundation

protocol MapperProtocol {
    
    associatedtype InputType
    associatedtype OutputType
    
    func map(model: InputType) -> OutputType
}
extension MapperProtocol {
    
    func map(model: [InputType]) -> [OutputType] {
        model.map(map)
    }
}

final class Mapper: MapperProtocol {
       
    func map(model: Heroes) -> ModelMainListCell {
        ModelMainListCell(id: model.id,
                          photoHeroes: model.image,
                          nameHeroes: model.name)
    }
}

final class DetailsHeroMapper: MapperProtocol {
    
    let parser = Parser()
    
    func map(model: DetailsAboutHeroDTO) -> ModelDetailsAboutHero {
        ModelDetailsAboutHero(
            header: ModelMainHeader(
                poster: model.image,
                name: model.name,
                status: model.status
            ),
            sections: [
                TypeDataSection("Info", rows: [
                    .info(ModelInfoCell(type: "Species", value: model.species), .auto),
                    .info(ModelInfoCell(type: "Type", value: model.type), .auto),
                    .info(ModelInfoCell(type: "Gender", value: model.gender), .auto),
                ]),
                TypeDataSection("Origin", rows: [
                    .origin(ModelOriginCell(
                        name: model.origin.name,
                        url: model.origin.url
                    ), .full),
                ]),
                TypeDataSection(
                    "Episodes",
                    rows: model.episode.map { episode in
                            .episode(ModelEpisodesCell(
                                name: episode.name,
                                episode: parser.parseSesonAndEpisode(data: episode.episode).episode,
                                season: parser.parseSesonAndEpisode(data: episode.episode).season,
                                date: episode.created.toDateString()
                            ), .full)
                    }
                )
            ]
        )
    }
}
