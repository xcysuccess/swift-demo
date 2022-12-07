//
//  UINavigationController+Extension.swift
//  02-tableview-home
//
//  Created by tomxiang on 2022/12/7.
//

import UIKit

extension UINavigationController {
    class func setGlobalNavStyle(rootVC:UIViewController){
        //设置导航栏字体颜色
        if #available(iOS 15.0,*) {
            let appearance = UINavigationBarAppearance()
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
            appearance.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 256*0.95/256.0, alpha: 1)
            rootVC.navigationController?.navigationBar.standardAppearance = appearance;
            rootVC.navigationController?.navigationBar.scrollEdgeAppearance = appearance;
        } else {
            rootVC.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
            //设置导航栏背景颜色
            rootVC.navigationController?.navigationBar.barTintColor = UIColor(red: 0.95, green: 0.95, blue: 256*0.95/256.0, alpha: 1)
            rootVC.navigationController?.navigationBar.isTranslucent = false
        }
    }
}
