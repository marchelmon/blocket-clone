//
//  LocationController.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-12.
//

import UIKit

enum OptionType {
    case category
    case location
}

private let optionCell = "OptionCell"

protocol AdOptionsControllerDelegate: class {
    func didSelectCategory(withIndex index: Int)
    func didSelectLocation(withIndex index: Int)
}

class AdOptionsController: UITableViewController {
    
    //MARK: - Properties
    
    weak var delegate: AdOptionsControllerDelegate?
    
    private let optionType: OptionType
    private let options: [String]
    private var selectedIndex: Int
    
    //MARK: - Lifecycle
    
    init(optionType: OptionType, selectedIndex: Int) {
        self.optionType = optionType
        self.selectedIndex = selectedIndex
        self.options = optionType == .location ? Service.shared.locations : Service.shared.categories
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = optionType == .location ? "Ad location" : "Ad category"
        navigationController?.navigationBar.backgroundColor = .white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: optionCell)
        
    }

}


//MARK: -  UITableViewDelegate, UITableViewDataSource
extension AdOptionsController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: optionCell, for: indexPath)
        cell.accessoryType = indexPath.row == selectedIndex ? .checkmark : .none
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if optionType == .category {
            delegate?.didSelectCategory(withIndex: indexPath.row)
        } else if optionType == .location {
            delegate?.didSelectLocation(withIndex: indexPath.row)
        }
        selectedIndex = indexPath.row
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }

}




