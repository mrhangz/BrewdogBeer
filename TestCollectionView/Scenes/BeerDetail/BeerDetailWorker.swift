//
//  BeerDetailWorker.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 16/8/19.
//  Copyright (c) 2019 mrhangz. All rights reserved.
//

import UIKit

protocol BeerDetailStoreProtocol {
//  func getData(_ completion: @escaping (Result<Entity>) -> Void)
}

class BeerDetailWorker {

  var store: BeerDetailStoreProtocol

  init(store: BeerDetailStoreProtocol) {
    self.store = store
  }

  // MARK: - Business Logic

//  func doSomeWork(_ completion: @escaping (Result<Entity>) -> Void) {
//    // NOTE: Do the work
//    store.getData {
//      // The worker may perform some small business logic before returning the result to the Interactor
//      completion($0)
//    }
//  }
}
