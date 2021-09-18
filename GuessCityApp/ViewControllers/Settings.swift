
//
//  settings.swift
//  GuessCityApp
//
//  Created by Кирилл on 15.09.2021.
//



class Settings {
    
    static let shared = Settings()
    
    var amountOfQuestion = 10
    
    var cityOptionChoice = CityType.onlyRus.rawValue
    
    var cityOptions = CityType.allCases.map {$0.rawValue}
 
    private init() {}
}

