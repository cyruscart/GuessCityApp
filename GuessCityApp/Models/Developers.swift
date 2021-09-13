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
        
        let names = DataDevelopers.developers.names
        let surnames = DataDevelopers.developers.surnames
        let cities = DataDevelopers.developers.cities
        let ages = DataDevelopers.developers.ages
        let emails = DataDevelopers.developers.emails
        let futurePositions = DataDevelopers.developers.futurePositions
        let telegrams = DataDevelopers.developers.telegrams
        
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


