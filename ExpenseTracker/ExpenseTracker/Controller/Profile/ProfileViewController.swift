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
    @IBOutlet weak var totalBalanceView: UIView!
    @IBOutlet weak var expenseView: UIView!
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var incomeView: UIView!
    @IBOutlet weak var totalBalanceLabel: UILabel!
    @IBOutlet weak var expenseLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 20
        mainView.clipsToBounds = true
        
        totalBalanceView.layer.cornerRadius = 20
        totalBalanceView.clipsToBounds = true

        expenseView.layer.cornerRadius = 20
        expenseView.clipsToBounds = true

        incomeView.layer.cornerRadius = 20
        incomeView.clipsToBounds = true
    
//        loadUser()
    }
    
    func loadUser()
    {
        userNameLabel.text = User.shared.name
        surnameLabel.text = User.shared.surname
        totalBalanceLabel.text = String(User.shared.balcance) + " $"
        expenseLabel.text = String(User.shared.expense) + " $"
        incomeLabel.text = String(User.shared.income) + " $"
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.loadUser()
    }
}
