//
//  TabBarController.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 15.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    private var middleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = .darkGray

        let profileVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "profileVc")
        let middleVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addTransactionVc")

    }
}
