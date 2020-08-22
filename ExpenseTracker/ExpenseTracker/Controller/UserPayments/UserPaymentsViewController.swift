//
//  UserPaymentsViewController.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 22.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import UIKit

class UserPaymentsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.layer.cornerRadius = 15
        tableView.clipsToBounds = true
        tableView.delegate = self
        tableView.dataSource = self
     
        
        let userPaymentNib = UINib(nibName: "UserPaymentCell", bundle: nil)
        tableView.register(userPaymentNib, forCellReuseIdentifier: "userPaymentCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
}


extension UserPaymentsViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(User.shared.payment.count)
        return User.shared.payment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userPaymentCell") as! UserPaymentCell
        cell.selectionStyle = .none
        cell.configure(payment: User.shared.payment[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
