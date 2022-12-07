//
//  HomeViewController.swift
//  01-tableview
//
//  Created by tomxiang on 2022/12/5.
//  https://juejin.cn/post/6877434365996072973 迟到的Swift入门 - UITableView

import UIKit

fileprivate let HOME_UITableView_CELLID = "HOME_UITableViewCellID"

class HomeViewController: UIViewController {
    
    private lazy var header: UIView = {
           let v = UIView(frame: .zero)
           v.backgroundColor = .cyan
           return v
    }()

    private lazy var tableView: UITableView = {
         let tv = UITableView(frame: view.bounds, style: .grouped)
         tv.backgroundColor = .blue
         tv.separatorStyle = .none
         tv.rowHeight = 40
         tv.showsVerticalScrollIndicator = false
         tv.tableHeaderView = header
         tv.delegate = self
         tv.dataSource = self
         tv.contentInsetAdjustmentBehavior = .always
         tv.register(UITableViewCell.self, forCellReuseIdentifier: HOME_UITableView_CELLID)
         return tv
     }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        view.addSubview(tableView)
        UINavigationController.setGlobalNavStyle(rootVC: self)
        
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_more_add"), style: .done, target: self, action: #selector(showPopMenu))
    }
    // MARK: Menu
    @objc func showPopMenu() {
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    //MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: HOME_UITableView_CELLID, for: indexPath)

        cell.textLabel?.text = "\(indexPath.section) 组 -- \(indexPath.row) 行"

        return cell
    }
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let header = UILabel(frame: .zero)
        header.backgroundColor = .red
        header.font = UIFont.systemFont(ofSize: 18);
        header.text = "\(section) 组 -- 头"
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = UILabel(frame: .zero)
        footer.backgroundColor = .green
        footer.font = UIFont.systemFont(ofSize: 18);
        footer.text = "\(section) 组 -- 尾"
        return footer
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        header.frame.size.height = 200;
        tableView .reloadData()
    }
}

