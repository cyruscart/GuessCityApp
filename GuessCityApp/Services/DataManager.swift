//
//  DataManager.swift
//  GuessCityApp
//
//  Created by iMac on 13.09.2021.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    let cities = [
        "Moskow", "StPetersburg", "Surgut", "Tyumen", "Kazan", "Sochi",
        "Gelendzhik", "Ekaterinburg", "Omsk", "Novosibirsk", "Kaliningrad",
        "Pyatigorsk", "Krasnodar", "Samara", "RostovOnDon", "Simferopol",
        "Tomsk", "NizhnyNovgorod", "Ufa", "Krasnoyarsk", "Chelyabinsk",
        "Vladivostok", "Permian", "Voronezh", "Irkutsk", "Yaroslavl",
        "Volgograd", "Saratov", "Astrakhan", "Izhevsk", "fff"
    ]
    
    private init() {}
}
