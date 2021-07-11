//
//  Router.swift
//  RouletteSample
//
//  Created by Masato Takamura on 2021/07/11.
//

import UIKit

final class Router {
    static let shared = Router()
    private init() {}
    
    var window: UIWindow?
    
    func showRoot(window: UIWindow) {
        let vc = SettingViewController()
        let nav = UINavigationController(rootViewController: vc)
        window.rootViewController = nav
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func showRoulette(from: UIViewController, data: [String]) {
        let rouletteVC = RouletteViewController()
        rouletteVC.data = data
        from.show(to: rouletteVC)
    }
    
}
