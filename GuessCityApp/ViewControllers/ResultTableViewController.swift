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
    
    
    private let primaryColor = UIColor(
        red: 255/255,
        green: 255/255,
        blue: 255/255,
        alpha: 1
    )
    
    private let secondaryColor = UIColor(
        red: 25/255,
        green: 33/255,
        blue: 78/255,
        alpha: 1
    )
    
    override func viewWillAppear(_ animated: Bool) {
        let rightButtonItem = UIBarButtonItem.init(
              title: "Главный экран",
              style: .done,

            target: self,
            action: #selector(rightButtonAction(sender:))

        )
        
        self.navigationItem.rightBarButtonItem = rightButtonItem
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    @objc func rightButtonAction(sender: UIBarButtonItem) {
        performSegue(withIdentifier: "mainVC", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 70
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
            return 70
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let numbersOfRightQuestions = numbersOfQuestions - resultCity.count
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as? FirstResultCell {
                
                if numbersOfQuestions == numbersOfRightQuestions {
                    cell.resultLabel.text =
                        """
                        Поздравляем!!!
                        Вы ответили правильно на все вопросы!
                        """
                    cell.wrongAnswersLabel.text = ""
                
                } else {
                cell.resultLabel.text =
                    """
                    Поздравляем!!!
                    Вы ответили правильно на
                    \(numbersOfRightQuestions) из \(numbersOfQuestions)
                    вопросов!
                    """
                
                cell.wrongAnswersLabel.text = "Неправильные ответы:"
                }
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
            content.imageProperties.cornerRadius = 13
            
            cell.accessoryType = .disclosureIndicator
            cell.contentConfiguration = content
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let aboutCityVC = segue.destination as? AboutCityViewController else { return }
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let city = resultCity[indexPath.row - 1]
        
        aboutCityVC.aboutCity = city
        
    }
}
// MARK: - Set background color

extension UITableView {
    func setResultVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
        
    }
}
