//
//  MessagesController.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-09.
//

import UIKit

class MessagesController: UIViewController {


    //MARK: - Properties
    
    private let registerPrompt = RegisterPromptView()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerPrompt.controllerType = .messages
        
        view.addSubview(registerPrompt)
        registerPrompt.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 180)
    }
}
