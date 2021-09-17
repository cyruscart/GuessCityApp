//
//  AboutAppViewController.swift
//  GuessCityApp
//
//  Created by Анатолий Миронов on 12.09.2021.
//

import UIKit

class FirstDescriptionCell: UITableViewCell {
    @IBOutlet var aboutAppLabel: UILabel!
    @IBOutlet var developersLabel: UILabel!
}

class AboutAppViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 50
        
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    var developers: [Developer]!
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        } else {
            return 50
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "description", for: indexPath) as? FirstDescriptionCell {
                cell.aboutAppLabel.text = "Москва, Париж, Прага...Во многих ли городах вы бывали? А что вы знаете о них? Данное приложение отправит вас в небольшое путешествие по разным странам нашего мира. Отгадывайте города, узнавая новые факты и необычные места нашей планеты."
                cell.developersLabel.text = "Разработчики:"
                
                return cell
                
            } else {
                fallthrough
            }
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "developer", for: indexPath)
            var content = cell.defaultContentConfiguration()
            let developer = developers[indexPath.row - 1]
            
            content.text = developer.fullName
            content.textProperties.font = UIFont.systemFont(ofSize: 18.0)
            
            content.secondaryText = developer.email
            content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 14.0)
            
            content.image = UIImage(named: developer.email)
            content.imageProperties.cornerRadius = tableView.rowHeight / 2
            
            cell.contentConfiguration = content
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let developerDetailVC = segue.destination as? DeveloperDetailViewController else { return }
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let developer = developers[indexPath.row - 1]
        
        developerDetailVC.developer = developer
    }
}
