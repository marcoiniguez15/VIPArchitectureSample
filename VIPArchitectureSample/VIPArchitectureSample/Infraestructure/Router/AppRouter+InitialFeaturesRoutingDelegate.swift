//
//  AppRouter+InitialFeaturesRoutingDelegate.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 19/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import UIKit
extension AppRouter: InitialFeaturesRoutingDelegate {
    func routeToMarvelCharactersList(sourceViewController: UIViewController) {
        let viewController = CharactersListMarvelViewController(factory: AppInjector.CharactersListMarvelInjector(), mainView: CharactersListMarvelView(), dataSource: CharactersListMarvelModel.DataSource())
        sourceViewController.navigationController?.pushViewController(viewController, animated: true)
    }
}

