//
//  BeerDetailInteractor.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 16/8/19.
//  Copyright (c) 2019 mrhangz. All rights reserved.
//

import UIKit

protocol BeerDetailInteractorInterface {
  func setupData(request: BeerDetail.SetupData.Request)
  var beer: Beer? { get set }
}

class BeerDetailInteractor: BeerDetailInteractorInterface {
  var presenter: BeerDetailPresenterInterface!
  var worker: BeerDetailWorker?
  var beer: Beer?

  // MARK: - Business logic
  
  func setupData(request: BeerDetail.SetupData.Request) {
    if let beer = beer {
      let response = BeerDetail.SetupData.Response(beer: beer)
      presenter.presentData(response: response)
    }
  }
}
