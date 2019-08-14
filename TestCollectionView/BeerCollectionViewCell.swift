//
//  BeerCollectionViewCell.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 14/8/19.
//  Copyright © 2019 mrhangz. All rights reserved.
//

import UIKit

var imageCache: [String: UIImage] = [:]
//let imageCache = NSCache<NSString, UIImage>()

class BeerCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet private var beerImageView: UIImageView!
  @IBOutlet private var nameLabel: UILabel!
  @IBOutlet private var abvLabel: UILabel!

  func setupUI(beer: Beer) {
    nameLabel.text = beer.name
    abvLabel.text = "\(beer.abv)%"
    if let image = imageCache[beer.imageURL] {
      beerImageView.image = image
    } else if let url = URL(string: beer.imageURL) {
      DispatchQueue.global().async {
        if let data = try? Data(contentsOf: url) {
          if let image = UIImage(data: data) {
            DispatchQueue.main.sync {
              imageCache[beer.imageURL] = image
              self.beerImageView.image = image
            }
          }
        }
      }
    }
//    if let url = URL(string: beer.imageURL) {
//      DispatchQueue.global().async {
//        if let data = try? Data(contentsOf: url) {
//          if let image = UIImage(data: data) {
////            imageCache[beer.imageURL] = image
//            DispatchQueue.main.sync {
//              self.beerImageView.image = image
//            }
//          }
//        }
//      }
//    }
//    if let url = URL(string: beer.imageURL) {
//      if let data = try? Data(contentsOf: url) {
//        if let image = UIImage(data: data) {
//          self.beerImageView.image = image
//        }
//      }
//    }
  }

}
