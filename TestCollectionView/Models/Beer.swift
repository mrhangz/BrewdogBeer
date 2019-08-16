//
//  Beer.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 14/8/19.
//  Copyright © 2019 mrhangz. All rights reserved.
//

import Foundation

/*
 "id": 1,
 "name": "Buzz",
 "description": "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.",
 "image_url": "https://images.punkapi.com/v2/keg.png",
 "abv": 4.5,
 */

// success
// fail
// pending

struct Beer: Codable {
  let id: Int
  let name: String
  let description: String
  let imageURL: String
  let abv: Float
  
  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case description
    case imageURL = "image_url"
    case abv
  }
}
