//
//  TabBarC.swift
//  LittlePink-Book
//
//  Created by 王潇 on 2021/7/5.
//

import UIKit

class TabBarC: UITabBarController, UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
    }

}
