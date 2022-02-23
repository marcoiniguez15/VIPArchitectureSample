//
//  ItemTableViewCell.swift
//  BaseVIPArchitectureProject
//
//  Created by Iniguez Ollero, Marco on 14/11/18.
//  Copyright © 2018 Iniguez Ollero, Marco. All rights reserved.
//
import UIKit
import Kingfisher
// MARK: - ArtistTableViewCell

final class ArtistTableViewCell: UITableViewCell {
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageOverlayView: UIView!
  @IBOutlet weak var imageItem: UIImageView!

}

// MARK: - Public
extension ArtistTableViewCell {
  
  func prepareCell(with model: ArtistsListModel.CellModel) {
    titleLabel.text = model.name
    imageItem.kf.setImage(with: model.imageURL)
    imageOverlayView.backgroundColor = UIColor.darkGray
    imageOverlayView.alpha = 0.7

  }
}
