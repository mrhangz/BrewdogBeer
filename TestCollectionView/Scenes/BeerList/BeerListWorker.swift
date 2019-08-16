//
//  BeerListWorker.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 16/8/19.
//  Copyright (c) 2019 mrhangz. All rights reserved.
//

import UIKit

protocol BeerListStoreProtocol {
  func getBeers(page: Int, _ completion: @escaping (Result<[Beer], APIError>) -> Void)
}

class BeerListWorker {

  var store: BeerListStoreProtocol

  init(store: BeerListStoreProtocol) {
    self.store = store
  }

  // MARK: - Business Logic

  func getBeers(page: Int, _ completion: @escaping (Result<[Beer], APIError>) -> Void) {
    store.getBeers(page: page) { result in
      completion(result)
    }
  }
}
