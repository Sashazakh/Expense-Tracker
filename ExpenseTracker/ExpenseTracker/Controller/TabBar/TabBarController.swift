//
//  TabBarController.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 15.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = .darkGray
//        guard let tabItems = tabBar.items else { return }
//        tabItems[0].titlePositionAdjustment = UIOffset(horizontal: -15, vertical: 0)
//        tabItems[1].titlePositionAdjustment = UIOffset(horizontal: 15, vertical: 0)
//        
//        var middleButton = UIButton()
//        middleButton.frame.size = CGSize(width: 70, height: 70)
//        middleButton.backgroundColor = .blue
//        middleButton.layer.cornerRadius = 35
//        middleButton.layer.masksToBounds = true
//        middleButton.center = CGPoint(x: tabBar.frame.width / 2, y: 10)
//        tabBar.addSubview(middleButton)
        
    }
    
   
}
