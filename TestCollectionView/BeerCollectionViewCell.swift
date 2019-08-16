//
//  BeerCollectionViewCell.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 14/8/19.
//  Copyright © 2019 mrhangz. All rights reserved.
//

import UIKit

class BeerCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet private var beerImageView: UIImageView!
  @IBOutlet private var nameLabel: UILabel!
  @IBOutlet private var abvLabel: UILabel!

  func setupUI(viewModel: BeerList.GetBeers.ViewModel.BeerViewModel) {
    nameLabel.text = viewModel.name
    abvLabel.text = viewModel.abv
    ImageService().getImage(urlString: viewModel.imageURL) { (image) in
      self.beerImageView.image = image
    }
  }

}
