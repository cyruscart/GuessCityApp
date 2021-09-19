//
//  DataDeveloper.swift
//  GuessCityApp
//
//  Created by Анатолий Миронов on 11.09.2021.
//

class DataDeveloper {
    
    static let developers = DataDeveloper.getDevelopersList()
    
    let name: String
    let surname: String
    let city: String
    let age: Int
    let email: String
    let futurePosition: String
    let telegram: String
    
    static func getDevelopersList() -> [DataDeveloper] {
        
        let developersList = [
            DataDeveloper(
                name: "Кирилл",
                surname: "Телегин",
                city: "Омск",
                age: 32,
                email: "mr.tks@yandex.ru",
                futurePosition: "iOS-developer",
                telegram: "@mr_tks"
            ),
            DataDeveloper(
                name: "Артём",
                surname: "Павлов",
                city: "Тюмень",
                age: 30,
                email: "pavlov.tema@gmail.com",
                futurePosition: "iOS-developer",
                telegram: "@pavlov_art"
            ),
            DataDeveloper(
                name: "Анатолий",
                surname: "Миронов",
                city: "Москва",
                age: 27,
                email: "x7.7@bk.ru",
                futurePosition: "iOS-developer",
                telegram: "@Anatolii_Mir"
            )
        ]
        
        return developersList
    }
    
    private init(
        name: String,
        surname: String,
        city: String,
        age: Int,
        email: String,
        futurePosition: String,
        telegram: String
    ) {
        self.name = name
        self.surname = surname
        self.city = city
        self.age = age
        self.email = email
        self.futurePosition = futurePosition
        self.telegram = telegram
    }
}
