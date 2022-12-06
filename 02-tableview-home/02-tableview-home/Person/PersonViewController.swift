//
//  PersonViewController.swift
//  01-tableview
//
//  Created by tomxiang on 2022/12/5.
//

import UIKit

class PersonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange
        self.title = "个人中心"
        // Do any additional setup after loading the view.
        setNavStyle()
    }
    
    
    func setNavStyle(){
        //设置导航栏字体颜色
        if #available(iOS 15.0,*) {
            let appearance = UINavigationBarAppearance()
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            appearance.backgroundColor = UIColor(red: 66/256.0, green: 176/256.0, blue: 216/256.0, alpha: 1)
            navigationController?.navigationBar.standardAppearance = appearance;
            navigationController?.navigationBar.scrollEdgeAppearance = appearance;
        } else {
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            //设置导航栏背景颜色
            navigationController?.navigationBar.barTintColor = UIColor(red: 66/256.0, green: 176/256.0, blue: 216/256.0, alpha: 1)
            navigationController?.navigationBar.isTranslucent = false
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
