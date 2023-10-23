//
//  InitialRouter.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 19/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import UIKit

public class InitialRouter {

  // MARK: - Properties

  public static let shared = InitialRouter()

  public weak var delegate: InitialFeaturesRoutingDelegate?

  // MARK: - Lifecycle

  private init() {
  }

  // MARK: - Routing methods
    func routeToMarvelCharactersList(sourceViewController: UIViewController) {
        delegate?.routeToMarvelCharactersList(sourceViewController: sourceViewController)
    }
}
