//
//  BeerDetailViewController.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 16/8/19.
//  Copyright (c) 2019 mrhangz. All rights reserved.
//

import UIKit

protocol BeerDetailViewControllerInterface: class {
  func displayData(viewModel: BeerDetail.SetupData.ViewModel)
}

class BeerDetailViewController: UIViewController, BeerDetailViewControllerInterface {
  var interactor: BeerDetailInteractorInterface!
  var router: BeerDetailRouter!
  
  @IBOutlet private var nameLabel: UILabel!
  @IBOutlet private var beerImage: UIImageView!

  // MARK: - Object lifecycle

  override func awakeFromNib() {
    super.awakeFromNib()
    configure(viewController: self)
  }

  // MARK: - Configuration

  func configure(viewController: BeerDetailViewController) {
    let router = BeerDetailRouter()
    router.viewController = viewController

    let presenter = BeerDetailPresenter()
    presenter.viewController = viewController

    let interactor = BeerDetailInteractor()
    interactor.presenter = presenter
    interactor.worker = BeerDetailWorker(store: BeerDetailStore())

    viewController.interactor = interactor
    viewController.router = router
  }

  // MARK: - View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setupData()
  }

  // MARK: - Event handling

  func setupData() {
    // NOTE: Ask the Interactor to do some work

    let request = BeerDetail.SetupData.Request()
    interactor.setupData(request: request)
  }

  // MARK: - Display logic

  func displayData(viewModel: BeerDetail.SetupData.ViewModel) {
    nameLabel.text = viewModel.name
    ImageService().getImage(urlString: viewModel.imageURL) { (image) in
      self.beerImage.image = image
    }
  }

  // MARK: - Router

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    router.passDataToNextScene(segue: segue)
  }

  @IBAction func unwindToBeerDetailViewController(from segue: UIStoryboardSegue) {
    print("unwind...")
    router.passDataToNextScene(segue: segue)
  }
}
