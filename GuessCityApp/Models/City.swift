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
    
    static func getCities(amountOfQuestions: Int) -> [City] {
        var cities: [City] = []
        var indexCity = 0
        let allCities = DataManager.shared.cities.shuffled()
        for _ in 1...amountOfQuestions {
            cities.append(allCities[indexCity])
            indexCity += 1
        }
        return cities
    }
}
