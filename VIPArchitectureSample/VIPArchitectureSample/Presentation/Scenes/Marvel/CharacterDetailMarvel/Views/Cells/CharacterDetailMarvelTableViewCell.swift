//
//  CharacterDetailMarvelTableViewCell.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 6/7/21.
//

import UIKit

class CharacterDetailMarvelTableViewCell: UITableViewCell {
  @IBOutlet private weak var titleLabel: UILabel!
}

// MARK: - Public
extension CharacterDetailMarvelTableViewCell {
  
  func prepareCell(with model: CharacterDetailMarvelModel.CellModel) {
    titleLabel.text = model.title
  }
}

