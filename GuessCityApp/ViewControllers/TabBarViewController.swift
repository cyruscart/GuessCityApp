//
//  TabBarViewController.swift
//  GuessCityApp
//
//  Created by Анатолий Миронов on 14.09.2021.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private let developers = Developer.getDevelopersList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendInfoToViewControllers()
    }
    
    private func sendInfoToViewControllers() {
        guard let viewControllers = self.viewControllers else { return }
        
        for viewController in viewControllers {
            if let aboutAppVC = viewController as? AboutAppViewController {
                aboutAppVC.developers = developers
            }
        }
    }
    
}
