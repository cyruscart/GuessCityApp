//
//  AboutCityViewController.swift
//  GuessCityApp
//
//  Created by iMac on 16.09.2021.
//

import UIKit

class AboutCityViewController: UIViewController {
    
    @IBOutlet var nameCity: UILabel!
    @IBOutlet var aboutCityText: UILabel!
    
    @IBOutlet var cityImage: UIImageView!
    
    var aboutCity: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityImage.image = UIImage(named: aboutCity.image)
        cityImage.layer.cornerRadius = 13
        
        nameCity.text = aboutCity.name
        aboutCityText.text = aboutCity.description
    }
}

