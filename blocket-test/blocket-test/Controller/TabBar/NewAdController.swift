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
    private let topView = TopView()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerPrompt.controllerType = .newAd
        topView.controllerType = .newAd
        
        view.addSubview(topView)
        topView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 50)
        
        view.addSubview(registerPrompt)
        registerPrompt.anchor(top: topView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 150)
    }
    
}
