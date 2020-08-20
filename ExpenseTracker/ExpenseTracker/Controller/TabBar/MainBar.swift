//
//  MainBar.swift
//  ExpenseTracker
//
//  Created by Apple Deveopment on 15.08.2020.
//  Copyright © 2020 Apple Deveopment. All rights reserved.
//

import UIKit

class MainBar: UITabBar {
    private var middleButton = UIButton()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        
        setupMiddleButton()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.isHidden {
            return super.hitTest(point, with: event)
        }
        
        let from = point
        let to = middleButton.center
        
        return sqrt((from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)) <= 39 ? middleButton : super.hitTest(point, with: event)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        middleButton.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: 0)
    }
    
    func setupMiddleButton() {
        middleButton.frame.size = CGSize(width: 70, height: 70)
        middleButton.backgroundColor = .darkGray
        middleButton.layer.cornerRadius = 35
        middleButton.layer.masksToBounds = true
        middleButton.setImage(UIImage(named: "Plus"), for: .normal)
        middleButton.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: 0)
        middleButton.addTarget(self, action: #selector(showVc), for: .touchUpInside)
        addSubview(middleButton)
    }
    
    @objc func showVc() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addTransactionVc")
        let mainVc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: " mainTabBarVc")
        
        mainVc.present(vc, animated: true)
    }
}
