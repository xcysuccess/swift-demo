//
//  FoundViewController.swift
//  02-tableview-home
//
//  Created by tomxiang on 2022/12/7.
//

import UIKit

class FoundViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        self.title = "发现"
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

