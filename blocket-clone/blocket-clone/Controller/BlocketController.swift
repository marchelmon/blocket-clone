//
//  BlocketController.swift
//  blocket-clone
//
//  Created by marchelmon on 2021-06-07.
//

import UIKit

class BlocketController: UIViewController {
    
    //MARK: - Properties
    
    let bottomNavigation = BottomNavBar()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        

        view.addSubview(bottomNavigation)
        bottomNavigation.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, height: 120)
        
    }
    
    
}
