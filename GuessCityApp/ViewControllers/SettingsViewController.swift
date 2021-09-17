//
//  SettingsViewController.swift
//  GuessCityApp
//
//  Created by Кирилл on 15.09.2021.
//

import UIKit

class AmountOfQuestionCell: UITableViewCell {
    @IBOutlet weak var questionSlider: UISlider!
    @IBOutlet weak var questionLabel: UILabel!
    @IBAction func sliderMoved() {
        Settings.shared.amountOfQuestion = Int(questionSlider.value)
        questionLabel.text = String(Int(Settings.shared.amountOfQuestion))
    }
}

class SettingsViewController: UITableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return CityType.allCases.count
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Количество вопросов"
        } else {
            return "Выбор городов"
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var currentCell = UITableViewCell()
        
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "slider") as? AmountOfQuestionCell {
                cell.questionLabel.text = String(Settings.shared.amountOfQuestion)
                cell.questionSlider.value = Float(Settings.shared.amountOfQuestion)
                
                currentCell = cell
            }
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "city", for: indexPath)
            
            var content = cell.defaultContentConfiguration()
            
            content.text = Settings.shared.cityOptions[indexPath.row]
            
            cell.contentConfiguration = content
            
            if Settings.shared.cityOptionChoice == Settings.shared.cityOptions[indexPath.row] {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            
            currentCell = cell
        }
        return currentCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Settings.shared.cityOptionChoice = Settings.shared.cityOptions[indexPath.row]
        
        tableView.reloadData()
    }
}

