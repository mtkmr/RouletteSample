//
//  UIColor+.swift
//  RouletteSample
//
//  Created by Masato Takamura on 2021/07/11.
//

import UIKit

extension UIColor{
    
    //UIColorを16進数カラーコードで初期化できるようにする
    convenience init(hex: String, alpha: CGFloat = 1.0){
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
}
