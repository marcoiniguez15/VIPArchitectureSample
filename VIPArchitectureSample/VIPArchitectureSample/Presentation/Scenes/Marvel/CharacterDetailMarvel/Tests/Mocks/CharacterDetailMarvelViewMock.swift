//
//  CharacterDetailMarvelViewMock.swift
//  c
//
//  Created by marco.iniguez.ollero on 23/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample

final class CharacterDetailMarvelViewMock: CharacterDetailMarvelView {
    var updateDataSourceCalled = false
    var showDetailExpectation: XCTestExpectation!

    override func updateDataSource(with dataSource: CharacterDetailMarvelModel.ViewDataSource) {
        updateDataSourceCalled = true
        showDetailExpectation.fulfill()
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
private extension CharacterDetailMarvelViewMock {
  func loadViewFromNib() -> UIView {
    let bundle = Bundle(for: CharacterDetailMarvelView.self)
    let nib = UINib(nibName: "CharacterDetailMarvelView", bundle: bundle)
    let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView

    return nibView
  }
}
