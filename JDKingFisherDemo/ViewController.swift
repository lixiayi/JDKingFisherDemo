//
//  ViewController.swift
//  JDKingFisherDemo
//
//  Created by xiaoyi li on 17/1/3.
//  Copyright © 2017年 xiaoyi li. All rights reserved.
//

import UIKit
import Kingfisher



/* Kingfisher引用方法 */

//Open the Kingfisher folder, and drag Kingfisher.xcodeproj into the file navigator of your app project, under your app project.
//In Xcode, navigate to the target configuration window by clicking on the blue project icon, and selecting the application target under the "Targets" heading in the sidebar.
//In the tab bar at the top of that window, open the "Build Phases" panel.
//Expand the "Target Dependencies" group, and add Kingfisher.framework.
//Click on the + button at the top left of "Build Phases" panel and select "New Copy Files Phase". Rename this new phase to "Copy Frameworks", set the "Destination" to "Frameworks", and add Kingfisher.framework of the platform you need.


class ViewController: UIViewController {
    
    var task: RetrieveImageTask?
    
    @IBAction func clear(_ sender: AnyObject) {
        KingfisherManager.shared.cache.clearMemoryCache()
        KingfisherManager.shared.cache.clearDiskCache()
    }

    @IBAction func load(_ sender: AnyObject) {
        let url = URL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-9.jpg")
        task = imageView.kf.setImage(with: url, placeholder: nil, options: [.transition(ImageTransition.fade(1))], progressBlock: { (revicedSize, totalSize) in
            print("第一个文件下载进度：\(revicedSize)/\(totalSize)")
            }) { (image, error, catchType, imageUrl) in
                print("第一个文件下载完成")
        }
    }
    @IBAction func cancelAction(_ sender: AnyObject) {
        task?.cancel()
        print("下载文件已经取消")
    }
    
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

