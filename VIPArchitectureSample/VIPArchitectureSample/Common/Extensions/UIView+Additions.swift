//
//  UIView+Additions.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/2/22.
//

import UIKit
extension UIView {
  
  func nibSetup() -> UIView {
    backgroundColor = .clear
    let view = loadViewFromNib()
    view.frame = bounds
    view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    view.translatesAutoresizingMaskIntoConstraints = true
    addSubview(view)
    return view
  }
}
// MARK: - Private
private extension UIView {
  func loadViewFromNib() -> UIView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
    let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
    
    return nibView
  }
}
