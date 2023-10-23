//
//  MarvelRouter.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 19/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import UIKit

class MarvelRouter {

  // MARK: - Properties

  public static let shared = MarvelRouter()

  public weak var delegate: MarvelFeaturesRoutingDelegate?

  // MARK: - Lifecycle

    init() {
  }

  // MARK: - Routing methods
    func routeToCharactersList(sourceViewController: UIViewController) {
        delegate?.routeToCharactersList(sourceViewController: sourceViewController)
    }
    func routeToCharacterDetail(sourceViewController: UIViewController, characterId: Int) {
        delegate?.routeToCharacterDetail(sourceViewController: sourceViewController, characterId: characterId)
    }

    func showError(sourceViewController: UIViewController, model: ErrorModel) {
        sourceViewController.showAlertWithCompletion(
          title: model.title,
          message: model.message,
          okTitle: model.retryButtonTitle,
          cancelTitle: nil,
          completionBlock: { (done) in
            if done {
                if let vc = sourceViewController as? CharactersListMarvelViewController {
                  vc.errorRetryRequest()
                }
            }
          })

    }
}
