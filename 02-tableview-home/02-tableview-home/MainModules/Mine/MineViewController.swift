//
//  PersonViewController.swift
//  01-tableview
//
//  Created by tomxiang on 2022/12/5.
//

import UIKit

class MineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange
        self.title = "我"
        // Do any additional setup after loading the view.
        UINavigationController.setGlobalNavStyle(rootVC: self)
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
