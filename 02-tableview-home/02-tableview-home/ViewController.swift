//
//  ViewController.swift
//  01-tableview
//
//  Created by tomxiang on 2022/12/5.
//  https://juejin.cn/post/6937082955806277640 iOS Swift5从0到1系列（二）：学习UITabBarController

import UIKit

class ViewController: UITabBarController {
//    override var tabBarItem: UITabBarItem!
//    override var tabBarController: UITabBarController? { get }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTabBar()
        // Do any additional setup after loading the view.
    }
    
    func initTabBar() {
        let home = HomeViewController()
        let navHome = UINavigationController(rootViewController: home)

        navHome.tabBarItem.image = JYTool.imageResize(imageNamed:UIImage(named: "home_normal.png"), andResizeTo: CGSizeMake(25, 25))
        navHome.tabBarItem.selectedImage = JYTool.imageResize(imageNamed:UIImage(named: "home_selected.png"),andResizeTo: CGSizeMake(25, 25))
        navHome.tabBarItem.title = "首页"
        
        let mine = PersonViewController()
        let navMine = UINavigationController(rootViewController: mine)
        navMine.tabBarItem.image = JYTool.imageResize(imageNamed:UIImage(named: "mine_normal.png"), andResizeTo: CGSizeMake(25, 25))
        navMine.tabBarItem.selectedImage = JYTool.imageResize(imageNamed:UIImage(named: "mine_selected.png"), andResizeTo: CGSizeMake(25, 25))
        navMine.tabBarItem.title = "个人中心"
        
        viewControllers = [navHome, navMine]
        setViewControllers(viewControllers, animated: false)
        // 设置 tabBar & tabBarItem
        setTabBarItemAttributes(bgColor: UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1))
    }

    //这种方式比较灵活
    func setTabBarItemAttributes(fontName: String = "Courier",
                                 fontSize: CGFloat = 12,
                                 normalColor: UIColor = .gray,
                                 selectedColor: UIColor = .black,
                                 bgColor: UIColor = .white)
    {
        // tabBarItem 文字大小
        var attributes: [NSAttributedString.Key: Any] = [.font: UIFont(name: fontName, size: fontSize)!]
          
        // tabBarItem 文字默认颜色
        attributes[.foregroundColor] = normalColor
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
          
        // tabBarItem 文字选中颜色
        attributes[.foregroundColor] = selectedColor
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .selected)
          
        // tabBar 文字、图片 统一选中高亮色
        tabBar.tintColor = selectedColor
          
        // tabBar 背景色
        tabBar.barTintColor = bgColor
        tabBar.backgroundColor = bgColor //一定要设置，否则第二个tabbar退到首页再进可能会变色

    }
}


