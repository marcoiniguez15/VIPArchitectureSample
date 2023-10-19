//
//  AppDelegate.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 22/2/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  let appRouter = AppRouter()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
      appRouter.setup()
    setupRootViewController()
    return true
  }
  
  func setupRootViewController() {
    let vc = InitialSelectionViewController(factory: AppInjector.InitialSelectionInjector(), mainView: InitialSelectionView.init(), dataSource: InitialSelectionModel.DataSource())
    let navigationController = UINavigationController(rootViewController: vc)
    window = UIWindow.init(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.rootViewController =  appRouter.getMainNavigationController()
  }

}

