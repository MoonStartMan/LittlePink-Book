//
//  Extensions.swift
//  LittlePink-Book
//
//  Created by 王潇 on 2021/7/5.
//

import Foundation

extension Bundle {
    var appName: String {
        if let appName = localizedInfoDictionary?["CFBundleDisplayName"] as? String {
            return appName
        } else {
            return infoDictionary!["CFBundleDisplayName"] as! String
        }
    }
}
