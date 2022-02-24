//
//  ArtistDetailRouter.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 24/2/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import UIKit

protocol ArtistDetailRouting {
  
  func routeTo(_ route: ArtistDetailModel.Route)
}

final class ArtistDetailRouter {
  
  private weak var viewController: UIViewController?
  
  init(viewController: UIViewController?) {
    self.viewController = viewController
  }
}


// MARK: - ArtistDetailRouting
extension ArtistDetailRouter: ArtistDetailRouting {
  
  func routeTo(_ route: ArtistDetailModel.Route) {
    DispatchQueue.main.async {
      switch route {
        
      case let .showError(model):
        self.showErrorAlert(viewModel: model)
      }
    }
  }
}


// MARK: - Private Zone
private extension ArtistDetailRouter {
  
  func showErrorAlert(viewModel: ErrorModel) {
    self.viewController?.showAlertWithCompletion(
      title: viewModel.title,
      message: viewModel.message,
      okTitle: viewModel.retryButtonTitle,
      cancelTitle: nil,
      completionBlock: { (done) in
        if done {
            if let vc = self.viewController as? ArtistsListViewController {
              vc.errorRetryRequest()
            }
        }
      })
  }
}