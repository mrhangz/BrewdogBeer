//
//  BeerListRouter.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 16/8/19.
//  Copyright (c) 2019 mrhangz. All rights reserved.
//

import UIKit

protocol BeerListRouterInput {
  func navigateToBeerDetail()
}

class BeerListRouter: BeerListRouterInput {
  weak var viewController: BeerListViewController!

  // MARK: - Navigation

  func navigateToBeerDetail() {
     viewController.performSegue(withIdentifier: "ShowDetail", sender: nil)
  }

  // MARK: - Communication

  func passDataToNextScene(segue: UIStoryboardSegue) {
    if segue.identifier == "ShowDetail" {
      passDataToBeerDetailScene(segue: segue)
    }
  }

  func passDataToBeerDetailScene(segue: UIStoryboardSegue) {
    guard let beerDetailViewController = segue.destination as? BeerDetailViewController, let index = viewController.interactor.selectedIndex else {
      return
    }
    beerDetailViewController.interactor.beer = viewController.interactor.beers?[index]
  }
}
