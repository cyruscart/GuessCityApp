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
    let type: String
    
}

extension City {
    
    static func getCities() -> [City] {
        var cities: [City] = []
        
        let allCities = DataManager.shared.allCities.shuffled()
        let russianCities = DataManager.shared.russianCities.shuffled()
        let foreignCities = DataManager.shared.foreignCities.shuffled()
        
        switch Settings.shared.cityOptionChoice {
        case CityType.onlyRus.rawValue:
            for city in russianCities {
                cities.append(city)
            }
            
        case CityType.onlyForeign.rawValue:
            for city in foreignCities {
                cities.append(city)
            }
            
        case CityType.all.rawValue:
            for city in allCities {
                cities.append(city)
            }
        default:
            break
        }
        return cities
    }
    
    static func getCityList(type: String) -> [String] {
        var cities: [String] = []

        let russianCities = DataManager.shared.cityNamesListRus.shuffled()
        let foreignCities = DataManager.shared.cityNamesListForeign.shuffled()

        switch type {
        
        case CityType.onlyRus.rawValue:
            for city in russianCities {
                cities.append(city)
            }
            
        default:
                for city in foreignCities {
                    cities.append(city)
                }
        }
        return cities
    }
    
    static func getAllCities() -> [City] {
        var cities: [City] = []
        
        let allCities = DataManager.shared.allCities
        
        for city in allCities {
            cities.append(city)
        }
        return cities
    }
}

