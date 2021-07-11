//
//  AppDelegate.swift
//  RouletteSample
//
//  Created by Masato Takamura on 2021/07/10.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        Router.shared.showRoot(window: window)
        IQKeyboardManager.shared.enable = true
        return true
    }


}

