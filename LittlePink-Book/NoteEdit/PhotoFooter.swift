//
//  PhotoFooter.swift
//  LittlePink-Book
//
//  Created by 王潇 on 2021/7/8.
//

import UIKit

class PhotoFooter: UICollectionReusableView {
        
    @IBOutlet weak var adPhotoBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        adPhotoBtn.layer.borderWidth = 1
        adPhotoBtn.layer.borderColor = UIColor.quaternaryLabel.cgColor
    }
}
