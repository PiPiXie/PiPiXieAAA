//
//  TQTabBarViewController.swift
//  TuQiang_Rx
//
//  Created by XieLB on 2019/1/18.
//  Copyright © 2019年 XieLB. All rights reserved.
//

import UIKit


class TQNavigationController: UINavigationController {
    
    // 配置统一
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            guard let navBarBackImage = UIImage.init(named: "nav_reture_icon") else {
                return
            }
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: navBarBackImage.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(back))
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func back() {
        popViewController(animated: true)
    }
}

extension TQNavigationController {
    
    // 配置每个模块对应的标题、图片
    func configTabBarStyle(title: String, image: UIImage, selectImage: UIImage) {
        
        tabBarItem.title = title
        tabBarItem.image = image.withRenderingMode(.alwaysOriginal)
        tabBarItem.selectedImage = selectImage.withRenderingMode(.alwaysOriginal)
    }
}

class TQTabBarViewController: UITabBarController {
    
    // 配置导航条
    func configTabBarItemViewController(viewController: UIViewController, title: String, image: String, selectImage: String) {
        let navViewController = TQNavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        
        guard let tabBarNormalImage = UIImage.init(named: image) else {
            return
        }
        
        guard let tabBarSelectedImage = UIImage.init(named: selectImage) else {
            return
        }
        
        navViewController.configTabBarStyle(title: title, image: tabBarNormalImage, selectImage: tabBarSelectedImage)
        addChild(navViewController)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 首页
        configTabBarItemViewController(viewController: TQHomeCtrl(),
                                       title: "定位",
                                       image:"tab_location_n_icon",
                                       selectImage: "tab_location_s_icon")
        
        // 列表
        configTabBarItemViewController(viewController: TQListCtrl(),
                                       title: "列表",
                                       image: "tab_device_n_icon",
                                       selectImage: "tab_device_s_icon")
        
        // 告警
        configTabBarItemViewController(viewController: TQWarmCtrl(),
                                       title: "告警",
                                       image: "tab_massage_n_icon",
                                       selectImage: "tab_massage_s_icon")
        
        // 我的
        configTabBarItemViewController(viewController: TQMineCtrl(),
                                       title: "我的",
                                       image: "tab_mine_n_icon",
                                       selectImage: "tab_mine_s_icon")
        
        // 设置tabBar不透明
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor.init(red: 76 / 255.0, green: 180 / 255.0, blue: 165 / 255.0, alpha: 1.0)
        
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
    }
}
