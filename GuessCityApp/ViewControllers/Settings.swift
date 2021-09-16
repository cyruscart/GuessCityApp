
//
//  settings.swift
//  GuessCityApp
//
//  Created by Кирилл on 15.09.2021.
//



class Settings {
    
    static let shared = Settings()
    
    var amountOfQuestion = 15
    
    var cityOptionChoice = CityOption.onlyRus.rawValue
    
    var cityOptions = CityOption.allCases.map {$0.rawValue}
        
    
    private enum CityOption: String, CaseIterable {
        case onlyRus = "Города России"
        case onlyForeign = "Зарубежные города"
        case all = "Все города"
    }
    
    private init() {}
}

