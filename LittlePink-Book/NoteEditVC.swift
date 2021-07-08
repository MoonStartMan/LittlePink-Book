//
//  NoteEditVC.swift
//  LittlePink-Book
//
//  Created by 王潇 on 2021/7/7.
//

import UIKit

class NoteEditVC: UIViewController {

    let photos = [
        UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3")
    ]
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension NoteEditVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPhotoCellID, for: indexPath) as! PhotoCell
        
        cell.imageView.image = photos[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let photoFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kPhotoFooterID, for: indexPath) as! PhotoFooter
            
            return photoFooter
        default:
            fatalError("collectionView的footer出问题了")
        }
        return UICollectionReusableView()
    }
    
    
}

extension NoteEditVC: UICollectionViewDelegate {
    
}
