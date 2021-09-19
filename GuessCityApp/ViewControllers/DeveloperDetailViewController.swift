//
//  DeveloperDetailViewController.swift
//  GuessCityApp
//
//  Created by Анатолий Миронов on 12.09.2021.
//

import UIKit

class DeveloperDetailViewController: UIViewController {
    
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet weak var telegramLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    var developer: Developer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Разработчики"
        
        photo.image = UIImage(named: developer.email)
        photo.layer.cornerRadius = 10
        
        fullNameLabel.text = developer.fullName
        positionLabel.text = developer.futurePosition
        
        cityLabel.text = "Город:  \(developer.city)"
        ageLabel.text = "Возраст:  \(developer.age)"
        emailLabel.text = "Email:  \(developer.email)"
        telegramLabel.text = "Telegram:  \(developer.telegram)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
