//
//  MarvelFeaturesRoutingDelegate.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 19/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import UIKit

public protocol MarvelFeaturesRoutingDelegate: AnyObject {
  func routeToCharactersList(sourceViewController: UIViewController)
  func routeToCharacterDetail(sourceViewController: UIViewController, characterId: Int)
}
