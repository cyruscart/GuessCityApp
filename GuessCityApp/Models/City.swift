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
        
        let allCities = DataManager.shared.allCities.shuffled()
        let russianCities = DataManager.shared.russianCities.shuffled()
        let foreignCities = DataManager.shared.foreignCities.shuffled()
        
        switch Settings.shared.cityOptionChoice {
        case "Города России":
            for city in russianCities {
                cities.append(city)
            }
            
        case "Зарубежные города":
            for city in foreignCities {
                cities.append(city)
            }
            
        case "Все города":
            for city in allCities {
                cities.append(city)
            }
        default:
            break
        }
        return cities
    }
    
    static func getCityList() -> [String] {
        var cities: [String] = []
        
        let allCities = DataManager.shared.cityNamesListAll.shuffled()
        let russianCities = DataManager.shared.cityNamesListRus.shuffled()
        let foreignCities = DataManager.shared.cityNamesListForeign.shuffled()
        
        switch Settings.shared.cityOptionChoice {
        case "Города России":
            for city in russianCities {
                cities.append(city)
            }
            
        case "Зарубежные города":
            for city in foreignCities {
                cities.append(city)
            }
            
        case "Все города":
            for city in allCities {
                cities.append(city)
            }
        default:
            break
        }
        return cities
    }
}

