//
//  ProfileViewController.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 15.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var cashFlowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 20
        mainView.clipsToBounds = true
        
        cashFlowView.layer.cornerRadius = 20
        cashFlowView.clipsToBounds = true
    }

}
