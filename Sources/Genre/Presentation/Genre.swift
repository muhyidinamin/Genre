//
//  File.swift
//  
//
//  Created by Muhamad Muhyidin Amin on 09/02/21.
//

import Foundation

public struct Genre: Equatable, Identifiable {

    public let id: Int
    public let title: String
    public let image: String
    public let gamesCount: Int
    public let desc: String
}
