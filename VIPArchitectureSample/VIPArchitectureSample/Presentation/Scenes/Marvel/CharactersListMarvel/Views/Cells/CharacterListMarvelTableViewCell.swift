//
//  CharacterListTableViewCell.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 5/7/21.
//

import UIKit
import Kingfisher

final class CharacterListMarvelTableViewCell: UITableViewCell {
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var imageCharacter: UIImageView!

}

// MARK: - Public
extension CharacterListMarvelTableViewCell {
  
  func prepareCell(with model: CharactersListMarvelModel.CellModel) {
    titleLabel.text = model.name
    if let path = model.imageName {
      let urlImage = URL(string: path)
      imageCharacter.kf.setImage(with: urlImage)
    }

  }
}
