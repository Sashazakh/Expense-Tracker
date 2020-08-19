//
//  RegisterViewController.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 14.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var surnameTF: UITextField!
    @IBOutlet weak var moneyTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.layer.cornerRadius = 15
        registerButton.clipsToBounds = true
    }
    

    
    @IBAction func buttonAction(_ sender: UIButton) {
        User.shared.registerUser(name: nameTF.text, surname: surnameTF.text, balance: Int(moneyTF.text!))
            UserCoreDataManager.shared.findOrCreate(user: User.shared) { (userEnt) in
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainTabBarVc")
            self.present(vc, animated: true)
        }
    }
}
