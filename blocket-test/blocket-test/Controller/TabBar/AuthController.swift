//
//  AuthController.swift
//  blocket-storyboards
//
//  Created by marchelmon on 2021-06-08.
//

import UIKit

class AuthController: UIViewController {


    //MARK: - Properties
    
    private let registerPrompt = RegisterPromptView()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        registerPrompt.controllerType = .login
        
        view.addSubview(registerPrompt)
        registerPrompt.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 180)
        
    }
}
