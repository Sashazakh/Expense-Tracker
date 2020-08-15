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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.layer.cornerRadius = 15
        registerButton.clipsToBounds = true
    }
    
    
    @IBAction func buttonAction(_ sender: UIButton) {
    }
}
