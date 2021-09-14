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
    let age: Int
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
        
        for developer in DataDeveloper.getDevelopersList() {
            developers.append(
                Developer(
                    name: developer.name,
                    surname: developer.surname,
                    city: developer.city,
                    age: developer.age,
                    email: developer.email,
                    futurePosition: developer.futurePosition,
                    telegram: developer.telegram
                )
            )
        }
        
        return developers
    }
}


