//
//  ArtistsListViewController.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/2/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import UIKit

protocol ArtistsListDisplayLogic where Self: UIViewController {
  
  func displayViewModel(_ viewModel: ArtistsListModel.ViewModel)
}

final class ArtistsListViewController: BaseViewController {
  
  typealias ArtistsListFactory = ArtistsListInteractorFactorable & ArtistsListRouterFactorable

  private let mainView: ArtistsListView
  private var interactor: ArtistsListInteractable!
  private var router: ArtistsListRouting!
  override var isNavigationBarHidden: Bool { false }

  
  required init(factory: ArtistsListFactory, mainView: ArtistsListView, dataSource: ArtistsListModel.DataSource) {
    self.mainView = mainView
    
    super.init(nibName: nil, bundle: nil)
    
    let interactorFactory = factory as! ArtistsListInteractorFactorable.InteractableFactory
    interactor = factory.makeInteractor(factory: interactorFactory, viewController: self, dataSource: dataSource)
    router = factory.makeRouter(viewController: self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    interactor.doRequest(.prepareArtistList(page: 1))
  }
  
  override func loadView() {
    mainView.delegate = self
    view = mainView
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented, You shouldn't initialize the ViewController using Storyboards")
  }
}

// MARK: - ArtistsListDisplayLogic
extension ArtistsListViewController: ArtistsListDisplayLogic {

  func displayViewModel(_ viewModel: ArtistsListModel.ViewModel) {
    DispatchQueue.main.async {
      switch viewModel {

      case let .prepareArtistList(viewModelData):
        self.navigationItem.title = viewModelData.title
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.mainView.updateDataSource(with: viewModelData)
        
      case let .showError(model):
        self.router.routeTo(.showError(model:model))
        
      case let .showDetail(id):
        self.router.routeTo(.showArtistDetail(id: id))
      }
    }
  }
  
  func errorRetryRequest() {
    self.mainView.retryRequest()
  }
}


// MARK: - ArtistsListViewDelegate
extension ArtistsListViewController: ArtistsListViewDelegate {
  func nextPage(page: Int) {
    interactor.doRequest(.prepareArtistList(page: page))
  }
  
  
  func itemPressed(index: Int) {
    interactor.doRequest(.itemPressed(index: index))
  }
}

// MARK: - Private Zone
private extension ArtistsListViewController {
  
}
