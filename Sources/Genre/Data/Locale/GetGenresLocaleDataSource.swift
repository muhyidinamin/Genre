//
//  File.swift
//  
//
//  Created by Muhamad Muhyidin Amin on 07/02/21.
//

import Core
import Combine
import RealmSwift
import Foundation
 
public struct GetGenresLocaleDataSource: LocaleDataSource {
    
    public typealias Request = Any
    public typealias Response = GenreEntity
    
    private let _realm: Realm
    
    public init(realm: Realm) {
        _realm = realm
    }
    
    public func list(request: Any?) -> AnyPublisher<[GenreEntity], Error> {
        return Future<[GenreEntity], Error> { completion in
            let genres: Results<GenreEntity> = {
              self._realm.objects(GenreEntity.self)
                .sorted(byKeyPath: "title", ascending: true)
            }()
            completion(.success(genres.toArray(ofType: GenreEntity.self)))
          
        }.eraseToAnyPublisher()
    }
  
    public func add(entities: [GenreEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            do {
              try self._realm.write {
                    for genre in entities {
                      self._realm.add(genre, update: .all)
                    }
                    completion(.success(true))
                }
            } catch {
                completion(.failure(DatabaseError.requestFailed))
            }
            
        }.eraseToAnyPublisher()
    }
    
    public func get(id: Int) -> AnyPublisher<GenreEntity, Error> {
        fatalError()
    }
    
    public func update(id: Int, entity: GenreEntity) -> AnyPublisher<Bool, Error> {
        fatalError()
    }
}
