//
//  File.swift
//  
//
//  Created by Muhamad Muhyidin Amin on 07/02/21.
//

import Foundation
 
public struct GenreModel: Equatable, Identifiable {
 
    public let id: Int
    public let title: String
    public let image: String
    public let gamesCount: Int
    public let desc: String
  
    public init(id: Int, title: String, image: String, gamesCount: Int, desc: String) {
        self.id = id
        self.title = title
        self.image = image
        self.gamesCount = gamesCount
        self.desc = desc
    }
}
