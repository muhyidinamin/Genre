//
//  File.swift
//  
//
//  Created by Muhamad Muhyidin Amin on 07/02/21.
//

import Core
import RealmSwift
 
public struct GenreTransformer: Mapper {
    public typealias Request = String
    public typealias Response = [GenreResponse]
    public typealias Entity = [GenreEntity]
    public typealias Domain = [GenreModel]
    public typealias Presentation = [Genre]
    
    public init() {}
    
  public func transformResponseToEntity(request: String?, response: [GenreResponse]) -> [GenreEntity] {
        return response.map { result in
          print("genre step")
          let newGenre = GenreEntity()
          newGenre.id = result.id ?? 0
          newGenre.title = result.title ?? "Unknow"
          newGenre.image = result.image ?? "Unknow"
          newGenre.gamesCount = result.gamesCount ?? 0
          newGenre.desc = result.desc ?? "Unknow"
          return newGenre
        }
    }
    
    public func transformEntityToDomain(entity: [GenreEntity]) -> [GenreModel] {
        return entity.map { result in
          return GenreModel(
            id: result.id,
            title: result.title,
            image: result.image,
            gamesCount: result.gamesCount,
            desc: result.desc
          )
        }
    }
}

public extension Mapper {
  func mapGanreResponsesToListEntities(
    input genreArray: [GenreResponse]
  ) -> List<GenreEntity> {
    let genres = List<GenreEntity>()
    for genre in genreArray {
      let newGenre = GenreEntity()
      newGenre.id = genre.id ?? 0
      newGenre.title = genre.title ?? "Unknow"
      newGenre.image = genre.image ?? "Unknow"
      newGenre.gamesCount = genre.gamesCount ?? 0
      genres.append(newGenre)
    }
    return genres
  }
}
