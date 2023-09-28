//
//  CharacterDetailMarvelPresenter.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 6/7/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import Foundation

protocol CharacterDetailMarvelPresentationLogic {
    func presentResponse(_ response: CharacterDetailMarvelModel.Response)
}

final class CharacterDetailMarvelPresenter {
    private weak var viewController: CharacterDetailMarvelDisplayLogic?

    init(viewController: CharacterDetailMarvelDisplayLogic?) {
        self.viewController = viewController
    }
}


// MARK: - CharacterDetailMarvelPresentationLogic
extension CharacterDetailMarvelPresenter: CharacterDetailMarvelPresentationLogic {

    func presentResponse(_ response: CharacterDetailMarvelModel.Response) {

        switch response {

        case let .prepareCharactersDetail(data):
            self.prepareCharactersDetail(data: data)

        case let .showError(model):
            self.viewController?.displayViewModel(.showError(model: model))

        }
    }
}


// MARK: - Private Zone
private extension CharacterDetailMarvelPresenter {

    func prepareCharactersDetail(data: CharacterDetailMarvelEntity) {
        let titleComics = "Comics"
        let itemsComics = data.comics.compactMap { item -> CharacterDetailMarvelModel.CellModel in
            return CharacterDetailMarvelModel.CellModel(title: item.name)
        }

        let sectionComics = CharacterDetailMarvelModel.SectionModel(title: titleComics, items: itemsComics)

        let titleSeries = "Series"
        let itemsSeries = data.series.compactMap { item -> CharacterDetailMarvelModel.CellModel in
            return CharacterDetailMarvelModel.CellModel(title: item.name)
        }

        let sectionSeries = CharacterDetailMarvelModel.SectionModel(title: titleSeries, items: itemsSeries)

        let titleStories = "Stories"
        let itemsStories = data.stories.compactMap { item -> CharacterDetailMarvelModel.CellModel in
            return CharacterDetailMarvelModel.CellModel(title: item.name)
        }

        let sectionStories = CharacterDetailMarvelModel.SectionModel(title: titleStories, items: itemsStories)

        let titleEvents = "Events"
        let itemsEvents = data.events.compactMap { item -> CharacterDetailMarvelModel.CellModel in
            return CharacterDetailMarvelModel.CellModel(title: item.name)
        }

        let sectionEvents = CharacterDetailMarvelModel.SectionModel(title: titleEvents, items: itemsEvents)


        let viewData = CharacterDetailMarvelModel.ViewDataSource(
            title: data.name ,
            imageName: data.imageName,
            sections: [sectionComics, sectionSeries, sectionStories, sectionEvents])
        viewController?.displayViewModel(.prepareCharactersDetail(viewModelData: viewData))
    }
}
