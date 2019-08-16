//
//  BeerListPresenter.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 16/8/19.
//  Copyright (c) 2019 mrhangz. All rights reserved.
//

import UIKit

protocol BeerListPresenterInterface {
  func presentBeers(response: BeerList.GetBeers.Response)
}

class BeerListPresenter: BeerListPresenterInterface {
  weak var viewController: BeerListViewControllerInterface!

  // MARK: - Presentation logic

  func presentBeers(response: BeerList.GetBeers.Response) {
    let beers = response.beers
    var beerViewModels: [BeerList.GetBeers.ViewModel.BeerViewModel] = []
    for beer in beers {
      let name = beer.name
      let abv = "\(beer.abv)%"
      let imageURL = beer.imageURL
      let beerViewModel = BeerList.GetBeers.ViewModel.BeerViewModel(name: name, abv: abv, imageURL: imageURL)
      beerViewModels.append(beerViewModel)
    }
    let viewModel = BeerList.GetBeers.ViewModel(beerViewModels: beerViewModels)
    viewController.displayBeers(viewModel: viewModel)
  }
}
