//
//  AppDelegate.swift
//  iOSProficiencyExercise
//
//  Created by Liu Changhong on 5/4/20.
//  Copyright © 2020 Liu Changhong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var windonw: UIWindow?
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    if #available(iOS 13.0, *) {
      // Do something above iOS 13
    } else {
      windonw = UIWindow(frame: UIScreen.main.bounds)
      let mainVC = MainViewController()
      windonw?.rootViewController = UINavigationController(rootViewController: mainVC)
      windonw?.makeKeyAndVisible()
    }
    
    configureNavigationBar()
    
    return true
  }
  
  private func configureNavigationBar() {
    UINavigationBar.appearance().tintColor = .systemPink
  }
  
  // MARK: UISceneSession Lifecycle
  
  @available(iOS 13.0, *)
  func application(_ application: UIApplication,
                   configurationForConnecting connectingSceneSession: UISceneSession,
                   options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
  
  @available(iOS 13.0, *)
  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    
  }

}
