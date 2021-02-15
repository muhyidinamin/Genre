//
//  File.swift
//  
//
//  Created by Muhamad Muhyidin Amin on 07/02/21.
//

import Core
import Combine
import Alamofire
import Foundation
 
public struct GetGenresRemoteDataSource : DataSource {
    public typealias Request = Any
    
    public typealias Response = [GenreResponse]
    
    private let _endpoint: String
    
    public init(endpoint: String) {
        _endpoint = endpoint
    }
    
    public func execute(request: Any?) -> AnyPublisher<[GenreResponse], Error> {
        return Future<[GenreResponse], Error> { completion in
          if let url = URL(string: self._endpoint) {
            AF.request(url)
              .validate()
              .responseDecodable(of: GenresResponse.self) { response in
                switch response.result {
                case .success(let value):
                  completion(.success(value.results))
                case .failure:
                  completion(.failure(URLError.invalidResponse))
                }
              }
          }
        }.eraseToAnyPublisher()
    }
}
