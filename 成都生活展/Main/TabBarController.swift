//
//  TableViewController.swift
//  成都生活展
//
//  Created by pu on 2017/11/25.
//  Copyright © 2017年 pu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = #colorLiteral(red: 0.6903377175, green: 0.01265829615, blue: 0.01586744562, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let homeVC = HomeViewController()
        let reVC = RecommendViewController()
        let funVC = FunViewController()
        let musicVC = MusicViewController()
        addChildViewController(homeVC, title: "首页", image: #imageLiteral(resourceName: "icon_menu_hp_press"), selectedImage: #imageLiteral(resourceName: "icon_menu_hp_selected"))
        addChildViewController(reVC, title: "推荐", image: #imageLiteral(resourceName: "icon_menu_x_press"), selectedImage: #imageLiteral(resourceName: "icon_menu_x_selected"))
        addChildViewController(funVC, title: "景点", image: #imageLiteral(resourceName: "icon_menu_ihave_press"), selectedImage: #imageLiteral(resourceName: "icon_menu_ihave_selected"))
        addChildViewController(musicVC, title: "音乐", image: #imageLiteral(resourceName: "icon_menu_profile_press"), selectedImage: #imageLiteral(resourceName: "icon_menu_profile_selected"))
        
    }

    func addChildViewController(_ childController: UIViewController, title: String, image: UIImage, selectedImage: UIImage) {
        
        childController.title = title
        childController.tabBarItem.image = image
        childController.tabBarItem.selectedImage = selectedImage
        let nav = UINavigationController(rootViewController: childController)
        addChildViewController(nav)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
