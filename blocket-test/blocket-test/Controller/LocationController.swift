//
//  LocationController.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-12.
//

import UIKit

private let locationCell = "LocationCell"

class LocationController: UITableViewController {
    
    //MARK: - Properties
    
    var selectedIndex: Int?
    
    private let locations = [
        "Göteborg",
        "Stockholm",
        "Malmö",
        "Jönköping",
        "Lund",
        "Luleå",
        "Örebro",
        "Halmstad",
        "Umeå",
        "Linköping",
        "Skövde",
        "Växjö",
        "Uddevalla",
        "Trollhättan",
        "Strömstad",
        "Karlstad"
    ]
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.title = "Ad location"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: locationCell)
        
    }

}


//MARK: -  UITableViewDelegate, UITableViewDataSource
extension LocationController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: locationCell, for: indexPath)
        cell.accessoryType = indexPath.row == selectedIndex ? .checkmark : .none
        cell.textLabel?.text = locations[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let selectedCell = tableView.cellForRow(at: indexPath)
        selectedCell?.accessoryType = .checkmark
        tableView.reloadData()
    }
    
}
