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
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 20
        mainView.clipsToBounds = true
        
        cashFlowView.layer.cornerRadius = 20
        cashFlowView.clipsToBounds = true
        
        loadUser()
    }
    
    func loadUser()
    {
        userNameLabel.text = User.shared.name
        surnameLabel.text = User.shared.surname
    }

}
