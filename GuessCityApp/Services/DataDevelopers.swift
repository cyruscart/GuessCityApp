//
//  DataManager.swift
//  GuessCityApp
//
//  Created by Анатолий Миронов on 11.09.2021.
//


class DataDevelopers {
    static let developers = DataDevelopers()
    
    let names = ["Кирилл", "Артём", "Анатолий"]
    let surnames = ["Телегин", "Павлов", "Миронов"]
    let cities = ["Омск", "Тюмень", "Москва"]
    let ages = ["32", "30", "27"]
    let emails = ["mr.tks@yandex.ru", "pavlov.tema@gmail.com", "x7.7@bk.ru"]
    let futurePositions = [
        "Будущий junior iOS-developer",
        "Будущий junior iOS-developer",
        "Будущий junior iOS-developer"
    ]
    
    let telegrams = ["@mr_tks", "@pavlov_art", "@Anatolii_Mir"]
    
    private init() {}
}
