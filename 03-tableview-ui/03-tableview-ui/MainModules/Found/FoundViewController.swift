//
//  FoundViewController.swift
//  02-tableview-home
//
//  Created by tomxiang on 2022/12/7.
//  https://juejin.cn/post/7011395585618133029

import UIKit

fileprivate let headerH: CGFloat = 10.0
fileprivate let footerH: CGFloat = 0.01
fileprivate let cellH: CGFloat = 44.0
fileprivate let FOUND_CELL_ID = "FOUND_CELL_ID"

class FoundViewController: UIViewController {
    
    lazy var array_datas_:[[(String,String)]] = []
    private lazy var header: UIView = {
           let v = UIView(frame: .zero)
           v.backgroundColor = .blue
           return v
       }()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .grouped)
    
        tableView.contentInsetAdjustmentBehavior = .always
        tableView.backgroundColor = kCommonBgColor
        tableView.tableHeaderView = header
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: FOUND_CELL_ID)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        self.title = "发现"
        // Do any additional setup after loading the view.
        UINavigationController.setGlobalNavStyle(rootVC: self)
        initData()
        initUI()
    }
    
    func initData() {
        array_datas_ = [
                        [("ff_IconShowAlbum","朋友圈")],
                        [("ff_IconQRCode","扫一扫"),("ff_IconShake","摇一摇")],
                        [("setting_locationServices","附近的人")]
                       ]
    }
    
    func initUI() {
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
    }
}

extension FoundViewController:UITableViewDelegate, UITableViewDataSource{
     //MARK: UITableViewDataSource
      func numberOfSections(in tableView: UITableView) -> Int {
          return array_datas_.count
      }

      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return array_datas_[section].count
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let model = self.array_datas_[indexPath.section][indexPath.row]

          let cell = tableView.dequeueReusableCell(withIdentifier: FOUND_CELL_ID, for: indexPath)
          cell.imageView?.image = UIImage(named: model.0)
          cell.textLabel?.text = model.1
          cell.accessoryType = .disclosureIndicator

          return cell
      }
  
    //MARK: UITableViewDelegate
      func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return headerH
      }
      func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
          return UIView(frame: CGRect(x: 0, y: 0, width: 0, height: headerH))
      }
    
      func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
          return footerH
      }
      func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
          return UIView(frame: CGRect(x: 0, y: 0, width: 0, height: footerH))
      }

      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          tableView.deselectRow(at: indexPath, animated: true)
      }
}
