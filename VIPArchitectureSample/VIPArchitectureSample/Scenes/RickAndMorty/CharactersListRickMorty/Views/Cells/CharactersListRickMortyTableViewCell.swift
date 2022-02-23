//
//  ListCharactersTableViewCell.swift
//  VIPArchitectureSample
//
//  Created by Iniguez Ollero, Marco on 27/11/18.
//  Copyright © 2018 Iniguez Ollero, Marco. All rights reserved.
//

import UIKit
import Kingfisher

// MARK: - ListCharactersTableViewCell
class CharactersListRickMortyTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
}
// MARK: - Public
extension CharactersListRickMortyTableViewCell {
  
  func prepareCell(with model: CharactersListRickMortyModel.CellModel) {
    nameLabel.text = model.name
    statusLabel.text = model.status
    imageItem.kf.setImage(with: model.imageURL)
    speciesLabel.text = model.species
  }
}
