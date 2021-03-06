//
//  InitialSelectionView.swift
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

protocol InitialSelectionViewDelegate where Self: UIViewController {
  func lastFMPressed()
  func rickMortyPressed()
  func marvelPressed()

}

final class InitialSelectionView: BaseView {
  
  weak var delegate: InitialSelectionViewDelegate?
  
  private var dataSource: InitialSelectionModel.ViewDataSource?
  
  @IBOutlet weak var lastFMButton: UIButton!
  @IBOutlet weak var rickMortyButton: UIButton!
  @IBOutlet weak var marvelButton: UIButton!

  @IBOutlet weak var questionLabel: UILabel!


  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUIComponents()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupUIComponents()
  }
  func updateDataSource(with dataSource: InitialSelectionModel.ViewDataSource) {
    self.dataSource = dataSource
    self.lastFMButton.setTitle(dataSource.titleLastFMButton, for: .normal)
    self.rickMortyButton.setTitle(dataSource.titleRickMortyButton, for: .normal)
    self.marvelButton.setTitle(dataSource.titleMarvelButton, for: .normal)

    self.questionLabel.text = dataSource.questionTitle
  }
  @IBAction func lastFMAction () {
    delegate?.lastFMPressed()
  }
  @IBAction func rickMortyAction () {
    delegate?.rickMortyPressed()
  }
  @IBAction func marvelAction () {
    delegate?.marvelPressed()
  }
  
}

private extension InitialSelectionView {
  func setupUIComponents() {
   
  }
}

