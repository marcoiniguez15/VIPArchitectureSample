//
//  CharacterDetailMarvelView.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 6/7/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import UIKit
import Kingfisher

protocol CharacterDetailMarvelViewDelegate where Self: UIViewController {
  
}

final class CharacterDetailMarvelView: BaseView {
  
  weak var delegate: CharacterDetailMarvelViewDelegate?
  @IBOutlet weak var imageCharacter: UIImageView!
  @IBOutlet weak var characterTableView: UITableView!
  private var dataSource: CharacterDetailMarvelModel.ViewDataSource?

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUIComponents()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupUIComponents()
  }
  func updateDataSource(with dataSource: CharacterDetailMarvelModel.ViewDataSource) {
    self.dataSource = dataSource
    self.characterTableView.reloadData()
    if let path = dataSource.imageName {
      let urlImage = URL(string: path)
      imageCharacter.kf.setImage(with: urlImage)
    }
  }
  func reloadUIComponents() {
    self.characterTableView.tableFooterView = UIView()
    self.characterTableView.reloadData()
  }
}

private extension CharacterDetailMarvelView {
  func setupUIComponents() {
    self.reloadUIComponents()
    self.characterTableView.register(R.nib.characterDetailMarvelTableViewCell)
  }
}
// MARK: - UITableview
extension CharacterDetailMarvelView:  UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    if let data = dataSource {
      return data.sections.count
    }
    return 0
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let data = dataSource {
      return data.sections[section].items.count
    }
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.characterDetailMarvelTableViewCell, for: indexPath) else {
      return UITableViewCell()
    }
    if let data = dataSource  {
      cell.prepareCell(with: data.sections[indexPath.section].items[indexPath.row])
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return dataSource?.sections[section].title
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  }
}
