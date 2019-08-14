//
//  APIManager.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 14/8/19.
//  Copyright © 2019 mrhangz. All rights reserved.
//

import Foundation

class APIManager {
  func getBeers(urlString: String, completion: @escaping ([Beer]) -> Void) {
    guard let url = URL(string: urlString) else {
      return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
      if let _ = error {
        print("error")
      } else if let data = data, let response = response as? HTTPURLResponse {
        if response.statusCode == 200 {
          do {
            let values = try JSONDecoder().decode([Beer].self, from: data)
            print(values)
            completion(values)
          } catch (let error) {
            print(error)
          }
        }
      }
    }
    task.resume()
  }
}
