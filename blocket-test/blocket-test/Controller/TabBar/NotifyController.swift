//
//  NotifyController.swift
//  blocket-storyboards
//
//  Created by marchelmon on 2021-06-08.
//

import UIKit

class NotifyController: UIViewController {

    //MARK: - Properties
    
    private let registerPrompt = RegisterPromptView()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerPrompt.controllerType = .notify
        
        view.addSubview(registerPrompt)
        registerPrompt.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 180)
        
    }
}
