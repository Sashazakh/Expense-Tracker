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
    }
    
   
}