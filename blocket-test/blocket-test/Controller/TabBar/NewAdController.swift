//
//  NewAdController.swift
//  blocket-storyboards
//
//  Created by marchelmon on 2021-06-08.
//

import UIKit

class NewAdController: UIViewController {

    //MARK: - Properties
    
    private let registerPrompt = RegisterPromptView()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerPrompt.controllerType = .newAd
        
        
    }
    
}
