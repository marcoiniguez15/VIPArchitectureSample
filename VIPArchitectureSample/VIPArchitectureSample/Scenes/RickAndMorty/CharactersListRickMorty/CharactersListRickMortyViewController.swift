//
//  CharactersListRickMortyViewController.swift
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

protocol CharactersListRickMortyDisplayLogic where Self: UIViewController {
  
  func displayViewModel(_ viewModel: CharactersListRickMortyModel.ViewModel)
}

final class CharactersListRickMortyViewController: BaseViewController {
  
  typealias CharactersListRickMortyFactory = CharactersListRickMortyInteractorFactorable & CharactersListRickMortyRouterFactorable

  private let mainView: CharactersListRickMortyView
  private var interactor: CharactersListRickMortyInteractable!
  private var router: CharactersListRickMortyRouting!
  override var isNavigationBarHidden: Bool { false }

  
  required init(factory: CharactersListRickMortyFactory, mainView: CharactersListRickMortyView, dataSource: CharactersListRickMortyModel.DataSource) {
    self.mainView = mainView
    
    super.init(nibName: nil, bundle: nil)
    
    let interactorFactory = factory as! CharactersListRickMortyInteractorFactorable.InteractableFactory
    interactor = factory.makeInteractor(factory: interactorFactory, viewController: self, dataSource: dataSource)
    router = factory.makeRouter(viewController: self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    interactor.doRequest(.prepareCharactersListRickMorty(page: 0))
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

// MARK: - CharactersListRickMortyDisplayLogic
extension CharactersListRickMortyViewController: CharactersListRickMortyDisplayLogic {

  func displayViewModel(_ viewModel: CharactersListRickMortyModel.ViewModel) {
    DispatchQueue.main.async {
      switch viewModel {

      case let .prepareCharactersListRickMorty(viewModelData):
        self.navigationItem.title = viewModelData.title
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.mainView.updateDataSource(with: viewModelData)
        
      case let .showError(model):
        self.router.routeTo(.showError(model:model))
        
      }
    }
  }
  
  func errorRetryRequest() {
    self.mainView.retryRequest()
  }
}


// MARK: - CharactersListRickMortyViewDelegate
extension CharactersListRickMortyViewController: CharactersListRickMortyViewDelegate {
  func filterCharacters(page: Int, nameFilter: String) {
    interactor.doRequest(.prepareCharactersListRickMorty(page: page, nameFilter: nameFilter))
  }
  
  
  func nextPage(page: Int) {
    interactor.doRequest(.prepareCharactersListRickMorty(page: page))
  }
  
}


// MARK: - Private Zone
private extension CharactersListRickMortyViewController {
  
}
