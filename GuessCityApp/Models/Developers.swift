//
//  Developers.swift
//  GuessCityApp
//
//  Created by Анатолий Миронов on 11.09.2021.
//

struct Developer {
    let name: String
    let surname: String
    let city: String
    let age: String
    let email: String
    let futurePosition: String
    let telegram: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension Developer {
    static func getDevelopersList() -> [Developer] {
        
        var developers: [Developer] = []
        
        let names = DataManager.developers.names
        let surnames = DataManager.developers.surnames
        let cities = DataManager.developers.cities
        let ages = DataManager.developers.ages
        let emails = DataManager.developers.emails
        let futurePositions = DataManager.developers.futurePositions
        let telegrams = DataManager.developers.telegrams
        
        let countOfIteration = min(names.count, surnames.count, emails.count)
        
        for index in 0..<countOfIteration {
            developers.append(
                Developer(
                    name: names[index],
                    surname: surnames[index],
                    city: cities[index],
                    age: ages[index],
                    email: emails[index],
                    futurePosition: futurePositions[index],
                    telegram: telegrams[index]
                )
            )
        }
        
        return developers
    }
}


