//
//  AddTransactionViewController.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 20.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import UIKit

class AddTransactionViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true
    }
   
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
