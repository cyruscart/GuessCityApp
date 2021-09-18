//
//  CityLibraryTableViewController.swift
//  GuessCityApp
//
//  Created by iMac on 18.09.2021.
//

import UIKit

class CityLibraryTableViewController: UITableViewController {

    var libraryOfCities: [City]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 70
        tableView.tableFooterView = UIView()
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        libraryOfCities.sort() { $0.name < $1.name }
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return libraryOfCities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCityCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        let city = libraryOfCities[indexPath.row]
        
        content.text = city.name
        
        content.image = UIImage(named: city.image)
        content.imageProperties.cornerRadius = 13
        
        cell.contentConfiguration = content

        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let libraryCityInfoVC = segue.destination as? LibraryCityInfoViewController else { return }
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let city = libraryOfCities[indexPath.row]
        
        libraryCityInfoVC.aboutCity = city
        
    }
  
}
