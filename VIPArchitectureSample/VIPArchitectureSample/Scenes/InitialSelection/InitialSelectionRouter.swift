//
//  InitialSelectionRouter.swift
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

protocol InitialSelectionRouting {
  
  func routeTo(_ route: InitialSelectionModel.Route)
}

final class InitialSelectionRouter {
  
  private weak var viewController: UIViewController?
  
  init(viewController: UIViewController?) {
    self.viewController = viewController
  }
}


// MARK: - InitialSelectionRouting
extension InitialSelectionRouter: InitialSelectionRouting {
  
  func routeTo(_ route: InitialSelectionModel.Route) {
    DispatchQueue.main.async {
      switch route {
        
      case .showLastFMFlow:
        self.showLastFMFlow()
        
      case .showRickMortyFlow:
        self.showRickMortyFlow()
        
      case .showMarvelFlow:
        self.showMarvelFlow()
      }
    }
  }
}


// MARK: - Private Zone
private extension InitialSelectionRouter {
  
  func showLastFMFlow() {
    let viewController = ArtistsListViewController(factory: AppInjector.ArtistsListInjector(), mainView: ArtistsListView(), dataSource: ArtistsListModel.DataSource())
    self.viewController?.navigationController?.pushViewController(viewController, animated: true)
  }
  
  func showRickMortyFlow() {
    let viewController = CharactersListRickMortyViewController(factory: AppInjector.CharactersListRickMortyInjector(), mainView: CharactersListRickMortyView(), dataSource: CharactersListRickMortyModel.DataSource())
    self.viewController?.navigationController?.pushViewController(viewController, animated: true)
  }
  func showMarvelFlow() {
    let viewController = CharactersListMarvelViewController(factory: AppInjector.CharactersListMarvelInjector(), mainView: CharactersListMarvelView(), dataSource: CharactersListMarvelModel.DataSource())
    self.viewController?.navigationController?.pushViewController(viewController, animated: true)
  }
  
}
