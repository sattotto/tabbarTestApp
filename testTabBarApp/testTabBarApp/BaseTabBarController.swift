//
//  BaseTabBarController.swift
//  testTabBarApp
//
//  Created by satoto on 2017/12/18.
//  Copyright © 2017年 佐藤秀輔. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {

    let underlineLayer = CALayer()
    var tabItemWidth: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        
        // Do any additional setup after loading the view.
        // tabbarのタイトルを少し上に上げる
        UITabBarItem.appearance().titlePositionAdjustment = UIOffsetMake(0, -8)
        // tabbar内のアイテムの個数をfloatで保存
        let tabItemCount = CGFloat((tabBar.items?.count)!)
        // tabbar内で動くBarの長さを設定
        tabItemWidth = self.view.frame.width / tabItemCount
        // barの色を設定
        underlineLayer.backgroundColor = UIColor.red.cgColor
        // barの設定
        underlineLayer.frame = CGRect(x: 0, y: tabBar.frame.size.height-5, width: tabItemWidth, height: 2.5)
        tabBar.layer.addSublayer(underlineLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let x = CGFloat(self.selectedIndex) * tabItemWidth
        underlineLayer.frame.origin.x = x
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
