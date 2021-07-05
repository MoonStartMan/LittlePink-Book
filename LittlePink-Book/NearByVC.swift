//
//  NearByVC.swift
//  LittlePink-Book
//
//  Created by 王潇 on 2021/7/3.
//

import UIKit
import XLPagerTabStrip

class NearByVC: UIViewController,IndicatorInfoProvider{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo.init(title: NSLocalizedString("NearBy", comment: "网页上方的附近标签"))
    }

}
