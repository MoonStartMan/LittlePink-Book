//
//  TabBarC.swift
//  LittlePink-Book
//
//  Created by 王潇 on 2021/7/5.
//

import UIKit
import YPImagePicker

class TabBarC: UITabBarController, UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is PostVC {
            
            //待做(判断是否登录)
            
            var config = YPImagePickerConfiguration()
            
            //  MARK: 通用配置
            config.isScrollToChangeModesEnabled = false
            config.onlySquareImagesFromCamera = false
            config.albumName = Bundle.main.appName
            config.startOnScreen = .library
            config.screens = [.library, .video, .photo]
            config.maxCameraZoomFactor = 5
            
            //  小红书的照片和视频逻辑:
            //  1.照片和视频不可混排,且在相册中多选的视频最后会帮我们合成一个视频(即最终只能有一个视频)
            //  2.无论是相册照片还是现拍照片,之后在编辑页面皆可追加
            //  总结: 允许一个笔记发布单个视频或多张照片
            
            //  MARK: 相册配置
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = kMaxPhotoCount
            config.library.spacingBetweenItems = 2
            
            //  MARK: 视频配置
            config.video.recordingTimeLimit = 60.0
            config.video.libraryTimeLimit = 60.0
            config.video.minimumTimeLimit = 3.0
            config.video.trimmerMaxDuration = 60.0
            config.video.trimmerMinDuration = 3.0
            
            //  MARK: - Gallery(多选完后的展示和编辑页面)-画廊
            config.gallery.hidesRemoveButton = false
            
            let picker = YPImagePicker()
            
            //  MARK: 选完或按取消按钮后的异步回调处理 (依据配置处理单个或多个)
            picker.didFinishPicking { [unowned picker] items, cancelled in
                if cancelled {
//                    print("用户按了左上角的取消按钮")
                }
                picker.dismiss(animated: true, completion: nil)
            }
            present(picker, animated: true, completion: nil)
            
            return false
        }
        
        return true

    }

}
