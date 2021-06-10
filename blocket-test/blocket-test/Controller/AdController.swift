//
//  AdController.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-10.
//

import UIKit

class AdController: UIViewController {
    
    //MARK: - Properties
    
    var ad: Ad? {
        didSet {
            print("DID SET AD: \(ad?.title)")
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
    
}
