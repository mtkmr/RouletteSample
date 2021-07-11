//
//  UIViewController+.swift
//  RouletteSample
//
//  Created by Masato Takamura on 2021/07/11.
//

import UIKit

extension UIViewController {
    /// 次のViewへ遷移する
    func show(to nextVC: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            if let nav = self.navigationController {
                nav.pushViewController(nextVC, animated: animated)
                completion?()
            } else {
                self.present(nextVC, animated: true, completion: completion)
            }
        }
    }
}

