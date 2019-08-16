//
//  BeerListInteractor.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 16/8/19.
//  Copyright (c) 2019 mrhangz. All rights reserved.
//

import UIKit

protocol BeerListInteractorInterface {
  func getBeers(request: BeerList.GetBeers.Request)
  func setSelectedIndex(request: BeerList.SetSelectedIndex.Request)
  var beers: [Beer]? { get }
  var selectedIndex: Int? { get }
}

class BeerListInteractor: BeerListInteractorInterface {
  var presenter: BeerListPresenterInterface!
  var worker: BeerListWorker?
  var beers: [Beer]?
  var page: Int = 1
  var selectedIndex: Int?

  // MARK: - Business logic

  func getBeers(request: BeerList.GetBeers.Request) {
    worker?.getBeers(page: page) { [weak self] apiResponse in
      switch apiResponse {
      case .success(let beers):
        self?.beers = beers
        let response = BeerList.GetBeers.Response(beers: beers)
        self?.presenter.presentBeers(response: response)
        self?.page += 1
      case .failure(let error):
        print(error) // show error
      }
    }
  }
  
  func setSelectedIndex(request: BeerList.SetSelectedIndex.Request) {
    selectedIndex = request.index
    let response = BeerList.SetSelectedIndex.Response()
    presenter.presentSelectedIndex(response: response)
  }
}
