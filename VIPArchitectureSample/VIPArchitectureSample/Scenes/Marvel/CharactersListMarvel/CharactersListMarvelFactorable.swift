//
//  CharactersListMarvelFactorable.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 5/7/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import UIKit

extension AppInjector {
  
  struct CharactersListMarvelInjector {}
}

extension AppInjector.CharactersListMarvelInjector: CharactersListMarvelFactorable {}

protocol CharactersListMarvelFactorable: CharactersListMarvelInteractorFactorable, CharactersListMarvelPresenterFactorable, CharactersListMarvelRouterFactorable, CharactersListMarvelServicesFactorable { }

protocol CharactersListMarvelInteractorFactorable {
  typealias InteractableFactory = CharactersListMarvelPresenterFactorable & CharactersListMarvelServicesFactorable
  
  func makeInteractor(factory: InteractableFactory, viewController: CharactersListMarvelDisplayLogic?, dataSource: CharactersListMarvelModel.DataSource) -> CharactersListMarvelInteractable
}

protocol CharactersListMarvelPresenterFactorable {
  func makePresenter(viewController: CharactersListMarvelDisplayLogic?) -> CharactersListMarvelPresentationLogic
}

protocol CharactersListMarvelRouterFactorable {
  func makeRouter(viewController: UIViewController?) -> CharactersListMarvelRouting
}

extension CharactersListMarvelFactorable {
  
  func makeInteractor(factory: InteractableFactory, viewController: CharactersListMarvelDisplayLogic?, dataSource: CharactersListMarvelModel.DataSource) -> CharactersListMarvelInteractable {
    CharactersListMarvelInteractor(factory: factory, viewController: viewController, dataSource: dataSource)
  }
  
  func makePresenter(viewController: CharactersListMarvelDisplayLogic?) -> CharactersListMarvelPresentationLogic {
    CharactersListMarvelPresenter(viewController: viewController)
  }
  
  func makeRouter(viewController: UIViewController?) -> CharactersListMarvelRouting {
    CharactersListMarvelRouter(viewController: viewController)
  }
}


// MARK: - Service Factorable
protocol CharactersListMarvelServicesFactorable {
  func makeApiService() -> APIClientProtocol
}

extension CharactersListMarvelServicesFactorable {
  
  func makeApiService() -> APIClientProtocol {
    APIClient.shared
  }
}