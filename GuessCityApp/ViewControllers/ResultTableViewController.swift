//
//  ResultTableViewController.swift
//  GuessCityApp
//
//  Created by iMac on 16.09.2021.
//

import UIKit

class FirstResultCell: UITableViewCell {
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var wrongAnswersLabel: UILabel!
    
}

class ResultTableViewController: UITableViewController {
    
    var resultCity: [City]!
    var numbersOfQuestions: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 50
        
        tableView.tableFooterView = UIView()

        
    }

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numbersOfWrongQuestions = resultCity.count
        return numbersOfWrongQuestions + 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        } else {
            return 50
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let numbersOfRightQuestions = numbersOfQuestions - resultCity.count
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as? FirstResultCell {
                cell.resultLabel.text = "Поздравляем! Вы ответили на \(numbersOfRightQuestions) из \(numbersOfQuestions) вопросов!"
                cell.wrongAnswersLabel.text = "Неправильные ответы:"
                
                
                
                return cell
            } else {
                fallthrough
            }
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WrongAnswersCell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            let wrongQueston = resultCity[indexPath.row - 1]

            content.text = wrongQueston.name
            
            content.image = UIImage(named: wrongQueston.image)
            
            cell.contentConfiguration = content
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
