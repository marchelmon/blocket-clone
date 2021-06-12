//
//  SettingsController.swift
//  blocket-storyboards
//
//  Created by marchelmon on 2021-06-08.
//

import UIKit

private let settingsCell = "SettingsCell"
private let notificationCell = "NotificationCell"

class SettingsController: UITableViewController {
    
    //MARK: - Properties
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.register(SettingsCell.self, forCellReuseIdentifier: settingsCell)
        tableView.register(NotificationsCell.self, forCellReuseIdentifier: notificationCell)
        
    }
}

//MARK: - TableViewDelegate/DataSource
extension SettingsController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 2
        case 3:
            return 3
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "Notifications"
        case 1:
            return "User data"
        case 2:
            return "Terms And Conditions"
        case 3:
            return "Help"
        default:
            return "HELP"
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: settingsCell) as! SettingsCell
        
        switch indexPath.section {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: notificationCell, for: indexPath) as! NotificationsCell
        case 1:
            cell.title.text = "Settings & Security"
        case 2:
            cell.title.text = indexPath.row == 0 ? "Terms of usage" : "Personal data"
        case 3:
            switch indexPath.row {
            case 0:
                cell.title.text = "Customer Service"
            case 1:
                cell.title.text = "Tips and inspiration"
            case 2:
                cell.title.text = "Customer safety"
            default:
                print("default cell row")
            }
        default:
            print("default section cell")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 { return }

        //TODO: Should present setting related controller
        
    }
    
}

