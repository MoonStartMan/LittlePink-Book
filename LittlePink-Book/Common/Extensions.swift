//
//  Extensions.swift
//  LittlePink-Book
//
//  Created by 王潇 on 2021/7/5.
//

import UIKit
import MBProgressHUD

extension UIView {
    @IBInspectable
    var radius: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}

extension UIViewController {
    
    //  MARK: - 展示加载框或提示框
    
    //  MARK: 加载框--手动隐藏
    
    //  MARK: 提示框--自动隐藏
    func showTextHUD(_ title: String, _ subTitle: String? = nil) {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text    //  不指定的话显示菊花提示和下面的配置文本
        hud.label.text = title
        hud.detailsLabel.text = subTitle
        hud.hide(animated: true, afterDelay: 2)
    }
}

extension Bundle {
    var appName: String {
        if let appName = localizedInfoDictionary?["CFBundleDisplayName"] as? String {
            return appName
        } else {
            return infoDictionary!["CFBundleDisplayName"] as! String
        }
    }
}
