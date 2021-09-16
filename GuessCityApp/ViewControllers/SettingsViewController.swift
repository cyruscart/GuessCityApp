//
//  SettingsViewController.swift
//  GuessCityApp
//
//  Created by Кирилл on 15.09.2021.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    @IBOutlet weak var questionSlider: UISlider!
    @IBOutlet weak var questionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        questionLabel.text = String(Settings.shared.amountOfQuestion)
        questionSlider.value = Float(Settings.shared.amountOfQuestion)
    }
    
    @IBAction func sliderMoved() {
        Settings.shared.amountOfQuestion = Int(questionSlider.value)
        questionLabel.text = String(Int(Settings.shared.amountOfQuestion))
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Количество вопросов"
    }
}


