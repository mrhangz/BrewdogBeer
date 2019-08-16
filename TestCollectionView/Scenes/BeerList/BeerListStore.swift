//
//  BeerListStore.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 16/8/19.
//  Copyright (c) 2019 mrhangz. All rights reserved.
//

import Foundation

class BeerListStore: BeerListStoreProtocol {
  func getBeers(page: Int, _ completion: @escaping (Result<[Beer], APIError>) -> Void) {
    let apiManager = APIManager()
    apiManager.getBeers(page: page) { (result) in
      DispatchQueue.main.sync {
        completion(result)
      }
    }
  }
}
