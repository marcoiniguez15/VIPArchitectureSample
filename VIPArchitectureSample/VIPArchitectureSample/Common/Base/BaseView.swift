//
//  BaseView.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/2/22.
//

import UIKit

class BaseView: UIView {
  @IBOutlet weak var view: UIView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    view = nibSetup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    view = nibSetup()
  }
}
