//
//  BeerCollectionViewCell.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 14/8/19.
//  Copyright © 2019 mrhangz. All rights reserved.
//

import UIKit

var imageCache: [String: UIImage] = [:]

class BeerCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet private var beerImageView: UIImageView!
  @IBOutlet private var nameLabel: UILabel!
  @IBOutlet private var abvLabel: UILabel!

  func setupUI(viewModel: BeerList.GetBeers.ViewModel.BeerViewModel) {
    nameLabel.text = viewModel.name
    abvLabel.text = viewModel.abv
    if let image = imageCache[viewModel.imageURL] {
      beerImageView.image = image
    } else if let url = URL(string: viewModel.imageURL) {
      DispatchQueue.global().async {
        if let data = try? Data(contentsOf: url) {
          if let image = UIImage(data: data) {
            DispatchQueue.main.sync {
              imageCache[viewModel.imageURL] = image
              self.beerImageView.image = image
            }
          }
        }
      }
    }
  }

}
