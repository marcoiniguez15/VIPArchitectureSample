//
//  CharactersListMarvelPresenter.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 5/7/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import Foundation

protocol CharactersListMarvelPresentationLogic {
    func presentResponse(_ response: CharactersListMarvelModel.Response)
}

final class CharactersListMarvelPresenter {
    private weak var viewController: CharactersListMarvelDisplayLogic?

    init(viewController: CharactersListMarvelDisplayLogic?) {
        self.viewController = viewController
    }
}


// MARK: - CharactersListMarvelPresentationLogic
extension CharactersListMarvelPresenter: CharactersListMarvelPresentationLogic {

    func presentResponse(_ response: CharactersListMarvelModel.Response) {

        switch response {

        case let .prepareCharactersListMarvel(list):
            self.prepareCharactersListMarvel(data: list)

        case let .showError(model):
            self.viewController?.displayViewModel(.showError(model: model))

        case let .showDetail(id):
            self.viewController?.displayViewModel(.showDetail(id: id))
        }
    }
}


// MARK: - Private Zone
private extension CharactersListMarvelPresenter {

    func prepareCharactersListMarvel(data: [CharactersListMarvelItemEntity]) {
        let title = "Characters List"
        let items = data.compactMap { item -> CharactersListMarvelModel.CellModel in
            return CharactersListMarvelModel.CellModel(name: item.name, imageName: item.imageName)
        }

        self.viewController?.displayViewModel(.prepareCharactersListMarvel(
            viewModelData: CharactersListMarvelModel.ViewDataSource(title: title, items: items)))
    }
}