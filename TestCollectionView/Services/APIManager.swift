//
//  APIManager.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 14/8/19.
//  Copyright © 2019 mrhangz. All rights reserved.
//

import Foundation

enum APIError: Error {
  case invalidJSON
  case invalidData
}

class APIManager {
  func getBeers(page: Int, completion: @escaping (Result<[Beer], APIError>) -> Void) {
    let urlString = "https://api.punkapi.com/v2/beers?page=\(page)"
    request(urlString: urlString, completion: completion)
  }
  
  private func request<T: Codable>(urlString: String, completion: @escaping (Result<[T], APIError>) -> Void) {
    guard let url = URL(string: urlString) else {
      return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
      if let _ = error {
        completion(.failure(.invalidData))
      } else if let data = data, let response = response as? HTTPURLResponse {
        if response.statusCode == 200 {
          do {
            sleep(2)
            let values = try JSONDecoder().decode([T].self, from: data)
            print(values)
            completion(.success(values))
          } catch {
            completion(.failure(.invalidJSON))
          }
        }
      }
    }
    task.resume()
  }
}
