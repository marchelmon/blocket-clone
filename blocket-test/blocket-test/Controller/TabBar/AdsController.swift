//
//  AdsController.swift
//  blocket-storyboards
//
//  Created by marchelmon on 2021-06-08.
//

import UIKit

class AdsController: UITableViewController {
    
    //MARK: - Properties    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var topButton: UIBarButtonItem!
    
    private let filterImage = UIImage(systemName: "slider.horizontal.3")
    private let cancelImage = UIImage(systemName: "xmark")
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        print(Service.shared.ads.count)
        
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

