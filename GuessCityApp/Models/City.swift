//
//  City.swift
//  GuessCityApp
//
//  Created by iMac on 13.09.2021.
//
import Foundation

struct City {

    let name: String
    let image: String
    let description: String
    
}

extension City {
    
    static func getCities() -> [City] {
        var cities: [City] = []
        
        let allCities = DataManager.shared.cities.shuffled()
        
        for city in allCities {
            cities.append(city)
        }
        
        return cities
    }
}
