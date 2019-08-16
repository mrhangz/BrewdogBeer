//
//  BeerListModels.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 16/8/19.
//  Copyright (c) 2019 mrhangz. All rights reserved.
//

import UIKit

struct BeerList {
  struct GetBeers {
    struct Request {
      
    }
    struct Response {
      let beers: [Beer]
    }
    struct ViewModel {
      struct BeerViewModel {
        let name: String
        let abv: String
        let imageURL: String
      }
      var beerViewModels: [BeerViewModel]
    }
  }
}
