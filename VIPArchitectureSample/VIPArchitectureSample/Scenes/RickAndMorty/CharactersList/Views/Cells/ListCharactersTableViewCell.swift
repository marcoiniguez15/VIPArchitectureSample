//
//  ListCharactersTableViewCell.swift
//  ExampleVIPArchitecture
//
//  Created by Iniguez Ollero, Marco on 27/11/18.
//  Copyright © 2018 Iniguez Ollero, Marco. All rights reserved.
//

import UIKit
import Kingfisher

// MARK: - ListCharactersTableViewCell
class ListCharactersTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
}
// MARK: - Public
extension ListCharactersTableViewCell {
  
  func prepareCell(with model: CharactersListModel.CellModel) {
    nameLabel.text = model.name
    statusLabel.text = model.status
    imageItem.kf.setImage(with: model.imageURL)
    speciesLabel.text = model.species
  }
}
