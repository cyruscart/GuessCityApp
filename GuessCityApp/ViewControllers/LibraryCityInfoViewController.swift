//
//  LibraryCityInfoViewController.swift
//  GuessCityApp
//
//  Created by iMac on 18.09.2021.
//

import UIKit

class LibraryCityInfoViewController: UIViewController {
    
    @IBOutlet var cityName: UILabel!
    @IBOutlet var cityInfo: UILabel!
    
    @IBOutlet var cityImage: UIImageView!
    
    var aboutCity: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityImage.image = UIImage(named: aboutCity.image)
        cityImage.layer.cornerRadius = 13
        
        cityName.text = aboutCity.name
        cityInfo.text = aboutCity.description
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
