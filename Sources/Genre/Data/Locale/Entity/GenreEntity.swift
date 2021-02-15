//
//  File.swift
//  
//
//  Created by Muhamad Muhyidin Amin on 07/02/21.
//

import Foundation
import RealmSwift

public class GenreEntity: Object {

  @objc dynamic var id: Int = 0
  @objc dynamic var title: String = ""
  @objc dynamic var image: String = ""
  @objc dynamic var gamesCount: Int = 0
  @objc dynamic var desc: String = ""

  public override static func primaryKey() -> String? {
    return "id"
  }
}
