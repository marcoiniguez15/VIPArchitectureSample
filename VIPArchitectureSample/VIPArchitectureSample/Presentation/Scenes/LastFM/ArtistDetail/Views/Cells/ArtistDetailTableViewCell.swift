//
//  ItemsDetailTableViewCell.swift
//  ExampleVIPArchitecture
//
//  Created by Iniguez Ollero, Marco on 26/11/18.
//  Copyright © 2018 Iniguez Ollero, Marco. All rights reserved.
//

import UIKit
import Kingfisher
// MARK: - ArtistDetailTableViewCell

/// ItemsDetailTableViewCell is the table view cell responsible to display an item
class ArtistDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageOverlayView: UIView!
    @IBOutlet weak var imageItem: UIImageView!
}

// MARK: - Public
extension ArtistDetailTableViewCell {
  
  func prepareCell(with model: ArtistDetailModel.CellModel) {
    rankLabel.text = model.rank
    titleLabel.text = model.title
    imageItem.kf.setImage(with: model.imageURL)
    imageOverlayView.backgroundColor = UIColor.darkGray
    imageOverlayView.alpha = 0.7
  }
}
