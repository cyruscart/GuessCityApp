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
    
    private let primaryColor = UIColor(
        red: 255/255,
        green: 255/255,
        blue: 255/255,
        alpha: 1
    )
    
    private let secondaryColor = UIColor(
        red: 25/255,
        green: 33/255,
        blue: 78/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityImage.image = UIImage(named: aboutCity.image)
        cityImage.layer.cornerRadius = 13
        
        nameCity.text = aboutCity.name
        aboutCityText.text = aboutCity.description
    }
}
// MARK: - Set background color

extension UIView {
    func setAboutCityVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
