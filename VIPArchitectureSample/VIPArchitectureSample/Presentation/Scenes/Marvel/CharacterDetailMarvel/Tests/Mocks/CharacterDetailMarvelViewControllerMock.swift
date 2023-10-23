//
//  CharacterDetailMarvelViewControllerMock.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 23/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample

final class CharacterDetailMarvelViewControllerMock: UIViewController, CharacterDetailMarvelDisplayLogic {
    var dismissExpectation: XCTestExpectation!
    var isDismissed: Bool = false
    var passedId: Int!
    var passedErrorModel: ErrorModel!
    var passedCharacter: CharacterDetailMarvelModel.ViewDataSource!

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        isDismissed = true
        dismissExpectation.fulfill()
    }

    func displayViewModel(_ viewModel: CharacterDetailMarvelModel.ViewModel) {
        switch viewModel {
        case let .prepareCharactersDetail(viewModelData):
            passedCharacter = viewModelData

        case let .showError(model):
            passedErrorModel = model

        }
    }

}
