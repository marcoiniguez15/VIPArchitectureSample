//
//  CharactersListRickMortyView.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/2/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import UIKit

protocol CharactersListRickMortyViewDelegate where Self: UIViewController {
  func nextPage(page:Int)
}

final class CharactersListRickMortyView: BaseView {
  
  weak var delegate: CharactersListRickMortyViewDelegate?
  
  let minItemsToReload: Int = 2
  var reloadingList: Bool = false
  var page = 0
  
  @IBOutlet weak var charactersTableView: UITableView!
  private var dataSource: CharactersListRickMortyModel.ViewDataSource?

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUIComponents()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupUIComponents()
  }
  func updateDataSource(with dataSource: CharactersListRickMortyModel.ViewDataSource) {
    self.dataSource = dataSource
    self.charactersTableView.reloadData()
    self.reloadingList = false
  }
  func reloadUIComponents() {
    self.charactersTableView.tableFooterView = UIView()
    self.charactersTableView.reloadData()
  }
  func retryRequest() {
    delegate?.nextPage(page: page)
  }
  
}

private extension CharactersListRickMortyView {
  func setupUIComponents() {
    charactersTableView.allowsMultipleSelection = false
    self.reloadUIComponents()
    self.charactersTableView.register(R.nib.charactersListRickMortyTableViewCell)
  }
}
// MARK: - UITableview
extension CharactersListRickMortyView:  UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let data = dataSource {
      return data.items.count
    }
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.charactersListRickMortyTableViewCell, for: indexPath) else {
      return UITableViewCell()
    }
    if let data = dataSource  {
      cell.prepareCell(with: data.items[indexPath.row])
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
      
      if tableView == charactersTableView {
        if let data = dataSource  {
          if !data.items.isEmpty {
            if !self.reloadingList &&  data.items.count - (indexPath as NSIndexPath).row < minItemsToReload {
                  self.reloadingList = true
                  page += 1
                  delegate?.nextPage(page: page)
              }
          }
        }
          
      }
  }
}