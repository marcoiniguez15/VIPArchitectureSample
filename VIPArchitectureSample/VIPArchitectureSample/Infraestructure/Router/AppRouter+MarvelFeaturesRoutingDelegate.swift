//
//  AppRouter+MarvelFeaturesRoutingDelegate.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 19/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//
import UIKit

extension AppRouter: MarvelFeaturesRoutingDelegate {
    func routeToCharactersList(sourceViewController: UIViewController) {
        let viewController = CharactersListMarvelViewController(factory: AppInjector.CharactersListMarvelInjector(), mainView: CharactersListMarvelView(), dataSource: CharactersListMarvelModel.DataSource())
        sourceViewController.navigationController?.pushViewController(viewController, animated: true)
    }

    func routeToCharacterDetail(sourceViewController: UIViewController, characterId: Int) {
        let viewController = CharacterDetailMarvelViewController(factory: AppInjector.CharacterDetailMarvelInjector(), mainView: CharacterDetailMarvelView(), dataSource: CharacterDetailMarvelModel.DataSource(characterId: characterId))
        sourceViewController.navigationController?.pushViewController(viewController, animated: true)
    }
}

