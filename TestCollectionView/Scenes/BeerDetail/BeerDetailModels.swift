//
//  BeerDetailModels.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 16/8/19.
//  Copyright (c) 2019 mrhangz. All rights reserved.
//

import UIKit

struct BeerDetail {
  struct SetupData {
    struct Request {}
    struct Response {
      let beer: Beer
    }
    struct ViewModel {
      let name: String
      let imageURL: String
    }
  }
}
