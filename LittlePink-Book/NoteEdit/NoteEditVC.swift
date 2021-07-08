//
//  NoteEditVC.swift
//  LittlePink-Book
//
//  Created by 王潇 on 2021/7/7.
//

import UIKit
import YPImagePicker
import SKPhotoBrowser
import AVKit

class NoteEditVC: UIViewController {

    var photos = [
        UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!
    ]
    
    var videoURL: URL?
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    var photoCount: Int{ photos.count }
    var isVideo: Bool { videoURL != nil}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension NoteEditVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoCount
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
            photoFooter.adPhotoBtn.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
            
            return photoFooter
        default:
            fatalError("collectionView的footer出问题了")
        }
        return UICollectionReusableView()
    }
    
    
}

extension NoteEditVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if isVideo {
            let playerVC = AVPlayerViewController()
            playerVC.player = AVPlayer(url: videoURL!)
            present(playerVC, animated: true) {
                playerVC.player?.play()
            }
        } else {
            var images: [SKPhoto] = []
            for photo in photos {
                images.append(SKPhoto.photoWithImage(photo))
            }
            
            let browser = SKPhotoBrowser(photos: images, initialPageIndex: indexPath.item)
            browser.delegate = self
            SKPhotoBrowserOptions.displayAction = false
            SKPhotoBrowserOptions.displayDeleteButton = true
            present(browser, animated: true)
        }
    }
}

extension NoteEditVC: SKPhotoBrowserDelegate {
    func removePhoto(_ browser: SKPhotoBrowser, index: Int, reload: @escaping (() -> Void)) {
        photos.remove(at: index)
        photoCollectionView.reloadData()
        reload()
    }
}

//  MARK: - 监听
extension NoteEditVC {
    @objc private func addPhoto(sender: UIButton) {
        if photoCount < kMaxPhotoCount {
            var config = YPImagePickerConfiguration()
            
            //  MARK: 通用配置
            config.albumName = Bundle.main.appName
            config.screens = [.library]
            
            
            //  MARK: 相册配置
            config.library.defaultMultipleSelection = true  //  是否可多选
            config.library.maxNumberOfItems = kMaxPhotoCount - photoCount    //  最大选取照片或视频数
            config.library.spacingBetweenItems = kSpacingBetweenItem    //  照片缩略图之间的间距
            
            //  MARK: - Gallery(多选完后的展示和编辑页面)-画廊
            config.gallery.hidesRemoveButton = false
            
            let picker = YPImagePicker(configuration: config)
            
            //  MARK: 选完或按取消按钮后的异步回调处理 (依据配置处理单个或多个)
            picker.didFinishPicking { [unowned picker] items, _ in
                
                for item in items {
                    if case let .photo(photo) = item {
                        self.photos.append(photo.image)
                    }
                }
                self.photoCollectionView.reloadData()
                
                picker.dismiss(animated: true)
            }
            present(picker, animated: true)
        } else {
            
            self.showTextHUD("最多只能选择\(kMaxPhotoCount)张照片哦")
        }
    }
}
