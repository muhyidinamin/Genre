//
//  File.swift
//  
//
//  Created by Muhamad Muhyidin Amin on 07/02/21.
//

import Foundation

public struct GenresResponse: Decodable {

  let results: [GenreResponse]
  
}

public struct GenreResponse: Decodable {

  private enum CodingKeys: String, CodingKey {
    case id = "id"
    case title = "name"
    case image = "image_background"
    case gamesCount = "games_count"
    case desc = "description"
  }

  let id: Int?
  let title: String?
  let image: String?
  let gamesCount: Int?
  let desc: String?

}
