//
//  TabBarViewController.swift
//  GuessCityApp
//
//  Created by Анатолий Миронов on 14.09.2021.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private let developers = Developer.getDevelopersList()
    private let cities = City.getAllCities()
    
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
            if let libraryOfCityVC = viewController as? CityLibraryTableViewController {
                libraryOfCityVC.libraryOfCities = cities
            }
            
        }
    }
    
}
