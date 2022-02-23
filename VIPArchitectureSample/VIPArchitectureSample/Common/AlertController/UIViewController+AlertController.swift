//
//  UIViewController+AlertController.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/2/22.
//

import UIKit
extension UIViewController {
  func showAlertWithCompletion(title: String, message:String, okTitle:String, cancelTitle:String?, isOkAcionPreferred: Bool = false, completionBlock:@escaping (_ okPressed:Bool) -> Void) {
    let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
    let titleFont = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
    let messageFont = UIFont.systemFont(ofSize: 13.0, weight: .regular)
    let titleAttrString = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font:titleFont])
    let messageAttrString = NSMutableAttributedString(string: message, attributes: [NSAttributedString.Key.font:messageFont])
    alertController.setValue(titleAttrString, forKey: "attributedTitle")
    alertController.setValue(messageAttrString, forKey: "attributedMessage")
    if let cancelTitle = cancelTitle {
      let cancelOption = UIAlertAction(title: cancelTitle, style: .default, handler: { (_) in
        completionBlock(false)
      })
      alertController.addAction(cancelOption)
    } 
    let okAction = UIAlertAction(title: okTitle, style: .default) { (_) in
      completionBlock(true)
    }
 
    alertController.addAction(okAction)
    if isOkAcionPreferred {
      // Set Preferred Action method
      alertController.preferredAction = okAction
    }
    self.present(alertController, animated: true, completion: nil)
  }
}
