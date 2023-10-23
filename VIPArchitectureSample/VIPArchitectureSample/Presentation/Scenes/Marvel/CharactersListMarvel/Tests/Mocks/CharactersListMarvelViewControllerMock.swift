//
//  CharactersListMarvelViewControllerMock.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 20/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample

final class CharactersListMarvelViewControllerMock: UIViewController, CharactersListMarvelDisplayLogic {
    var dismissExpectation: XCTestExpectation!
    var isDismissed: Bool = false
    var passedId: Int!
    var passedErrorModel: ErrorModel!
    var passedList: CharactersListMarvelModel.ViewDataSource!

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        isDismissed = true
        dismissExpectation.fulfill()
    }

    func displayViewModel(_ viewModel: CharactersListMarvelModel.ViewModel) {
        switch viewModel {
        case let .prepareCharactersListMarvel(viewModelData):
            passedList = viewModelData

        case let .showDetail(id):
            passedId = id

        case let .showError(model):
            passedErrorModel = model

        }
    }

}
