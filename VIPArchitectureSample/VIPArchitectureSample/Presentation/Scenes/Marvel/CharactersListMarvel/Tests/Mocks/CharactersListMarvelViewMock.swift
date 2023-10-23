//
//  CharactersListMarvelViewMock.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 23/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample

final class CharactersListMarvelViewMock: CharactersListMarvelView {
    var updateDataSourceCalled = false
    var showListExpectation: XCTestExpectation!

    override func updateDataSource(with dataSource: CharactersListMarvelModel.ViewDataSource) {
        updateDataSourceCalled = true
        showListExpectation.fulfill()
    }
    override func nibSetup() -> UIView {
        backgroundColor = .clear
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
        return view
    }
}

// MARK: - Private
private extension CharactersListMarvelViewMock {
  func loadViewFromNib() -> UIView {
    let bundle = Bundle(for: CharactersListMarvelView.self)
    let nib = UINib(nibName: "CharactersListMarvelView", bundle: bundle)
    let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView

    return nibView
  }
}
