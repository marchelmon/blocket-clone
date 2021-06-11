//
//  AdsController.swift
//  blocket-storyboards
//
//  Created by marchelmon on 2021-06-08.
//

import UIKit

private let reuseIdentifier = "AdCell"

class AdsController: UITableViewController {
    
    //MARK: - Properties
    
    private var ads = [Ad]()
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var topButton: UIBarButtonItem!
    
    private let filterImage = UIImage(systemName: "slider.horizontal.3")
    private let cancelImage = UIImage(systemName: "xmark")
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        tableView.register(AdCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        ads = Service.shared.ads
        
    }
    
    //MARK: - Actions
    
    @IBAction func topButtonPressed(_ sender: UIBarButtonItem) {
        if topButton.image == cancelImage {
            searchBar.resignFirstResponder()
            searchBar.text = ""
            topButton.image = nil
            topButton.image = filterImage
        } else {
            print("Show filter controller")
        }
    }
    
    @IBAction func searchAds(_ sender: UITextField) {
        searchBar.resignFirstResponder()
        searchBar.text = ""
        topButton.image = nil
        topButton.image = filterImage
    }
    
    @IBAction func startedTyping(_ sender: UITextField) {
        topButton.image = nil
        topButton.image = cancelImage
    }
    
}

//MARK: - UITableViewDataSource / UITableViewDelegate
extension AdsController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ads.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! AdCell
        let ad = ads[indexPath.row]
        cell.ad = ad
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = AdController()
        controller.ad = ads[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
}

