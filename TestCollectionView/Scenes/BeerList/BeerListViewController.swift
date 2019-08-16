//
//  BeerListViewController.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 16/8/19.
//  Copyright (c) 2019 mrhangz. All rights reserved.
//

import UIKit

protocol BeerListViewControllerInterface: class {
  func displayBeers(viewModel: BeerList.GetBeers.ViewModel)
}

class BeerListViewController: UIViewController, BeerListViewControllerInterface {
  var interactor: BeerListInteractorInterface!
  var router: BeerListRouter!
  
  @IBOutlet private var collectionView: UICollectionView!
  @IBOutlet private var loadingView: UIView!

  // MARK: - Object lifecycle

  override func awakeFromNib() {
    super.awakeFromNib()
    configure(viewController: self)
  }

  // MARK: - Configuration

  func configure(viewController: BeerListViewController) {
    let router = BeerListRouter()
    router.viewController = viewController

    let presenter = BeerListPresenter()
    presenter.viewController = viewController

    let interactor = BeerListInteractor()
    interactor.presenter = presenter
    interactor.worker = BeerListWorker(store: BeerListStore())

    viewController.interactor = interactor
    viewController.router = router
  }

  // MARK: - View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    let bundle = Bundle(for: BeerCollectionViewCell.self)
    let nib = UINib(nibName: "BeerCollectionViewCell", bundle: bundle)
    collectionView.register(nib, forCellWithReuseIdentifier: "BeerCollectionViewCell")
    
    getBeers()
  }

  // MARK: - Event handling

  func getBeers() {
    loadingView.isHidden = false
    let request = BeerList.GetBeers.Request()
    interactor.getBeers(request: request)
  }

  // MARK: - Display logic
  
  var beerViewModels: [BeerList.GetBeers.ViewModel.BeerViewModel] = []

  func displayBeers(viewModel: BeerList.GetBeers.ViewModel) {
    loadingView.isHidden = true
    beerViewModels.append(contentsOf: viewModel.beerViewModels)
    collectionView.reloadData()
  }

  // MARK: - Router

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    router.passDataToNextScene(segue: segue)
  }

  @IBAction func unwindToBeerListViewController(from segue: UIStoryboardSegue) {
    print("unwind...")
    router.passDataToNextScene(segue: segue)
  }
}

extension BeerListViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return beerViewModels.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeerCollectionViewCell", for: indexPath) as? BeerCollectionViewCell else {
      return UICollectionViewCell()
    }
    let viewModel = beerViewModels[indexPath.row]
    cell.setupUI(viewModel: viewModel)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    if indexPath.row == beerViewModels.count - 1 && loadingView.isHidden {
      getBeers()
    }
  }
}

extension BeerListViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
  }
}

extension BeerListViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.frame.size.width / 2.0
    let height = width * 1.5
    return CGSize(width: width, height: height)
  }
}
