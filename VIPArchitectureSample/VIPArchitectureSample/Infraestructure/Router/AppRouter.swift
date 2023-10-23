//
//  AppRouter.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 19/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import UIKit

class AppRouter {

  func setup() {
      MarvelRouter.shared.delegate = self
      InitialRouter.shared.delegate = self
  }
}

// MARK: - Helpers

extension AppRouter {
    func getMainNavigationController() -> UINavigationController? {
      let vc = InitialSelectionViewController(factory: AppInjector.InitialSelectionInjector(), mainView: InitialSelectionView.init(), dataSource: InitialSelectionModel.DataSource())
      return UINavigationController(rootViewController: vc)
  }
}

