//
//  HomeViewController.swift
//  01-tableview
//
//  Created by tomxiang on 2022/12/5.
//  https://juejin.cn/post/6877434365996072973 迟到的Swift入门 - UITableView

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        setNavStyle()
        
        // Do any additional setup after loading the view.
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    //https://www.jianshu.com/p/ac6ccca005f8 iOS15之后导航栏设置需要特殊处理
    func setNavStyle(){
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
    
    // MARK: Datasource
    // 设置表格中的章节（section）个数。
    func numberOfSections(in tableView: UITableView) -> Int {
       return 2
    }
    
    // 设置某一章节（section）中的单元格数量，必须实现。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //  初始化和复用指定索引位置的UITableViewCell，必须实现。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "Home_Cell_ID"
        var cell = tableView.dequeueReusableCell(withIdentifier:cellID)
        if cell == nil {
          cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = "这个是标题"
        cell?.detailTextLabel?.text = "这里是内容了油"
        cell?.imageView?.image = UIImage(named: "icon")
        return cell!
    }

}
