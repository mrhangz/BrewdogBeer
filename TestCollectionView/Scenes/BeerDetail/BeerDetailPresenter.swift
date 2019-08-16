//
//  BeerDetailPresenter.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 16/8/19.
//  Copyright (c) 2019 mrhangz. All rights reserved.
//

import UIKit

protocol BeerDetailPresenterInterface {
  func presentData(response: BeerDetail.SetupData.Response)
}

class BeerDetailPresenter: BeerDetailPresenterInterface {
  weak var viewController: BeerDetailViewControllerInterface!

  // MARK: - Presentation logic

  func presentData(response: BeerDetail.SetupData.Response) {
    let name = response.beer.name
    let imageURL = response.beer.imageURL
    let viewModel = BeerDetail.SetupData.ViewModel(name: name, imageURL: imageURL)
    viewController.displayData(viewModel: viewModel)
  }
}
