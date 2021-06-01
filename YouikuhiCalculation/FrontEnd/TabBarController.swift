//
//  TabBarController.swift
//  YouikuhiCalculation
//
//  Created by 柴英嗣 on 2021/04/11.
//

import UIKit

class TabBarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // -----＊＊追記部分＊＊----- //
        // アイコンの色を変更できます！
        UITabBar.appearance().tintColor = AppColor.secondary
        // 背景色を変更できます！
        UITabBar.appearance().barTintColor = AppColor.primary
        // -----＊＊追記部分＊＊----- //
    }

}
