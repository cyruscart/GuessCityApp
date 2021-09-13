//
//  City.swift
//  GuessCityApp
//
//  Created by iMac on 13.09.2021.
//

import Foundation

struct City {
    let titleOfCity: String
    
    static func getCities(amountOfQuestions: Int) -> [City] {
       
        var cities: [City] = []
        let titlesOfCities = DataManager.shared.cities.shuffled()
        
        for index in 0 ..< amountOfQuestions {
            //let city = City(titleOfCity: titlesOfCities[index])
            cities.append(City(titleOfCity: titlesOfCities[index]))
        }
        return cities
        //для сохранения
    }
}
