//
//  RegisterPromptView.swift
//  blocket-storyboards
//
//  Created by marchelmon on 2021-06-08.
//

import UIKit

enum ControllerType: CustomStringConvertible {
    case notify
    case newAd
    case messages
    case login
    
    var label: String {
        switch self {
        case .notify:
            return "Get notified for matching ads"
        case .newAd:
            return "You need an account to create ads"
        case .messages:
            return "All your messages in one place"
        case .login:
            return "Your blocket"
        }
    }
    
    var topLabel: String {
        switch self {
        case .notify:
            return "Observers"
        case .newAd:
            return "Add ad"
        case .messages:
            return "Messages"
        case .login:
            return "Profile"
        }
    }
    
    var description: String {
        switch self {
        case .notify:
            return "Tap the heart in the search results to get notified when new ads are added with the same search criteria"
        case .newAd:
            return ""
        case .messages:
            return ""
        case .login:
            return "Your ads, saved ads and handling your profile"
        }
    }
}

class RegisterPromptView: UIView {
    
    //MARK: - Properties
    
    var controllerType: ControllerType? {
        didSet {
            promptTitle.text = controllerType?.label
            promptDescription.text = controllerType?.description
        }
    }
    
    private let blocketImage: UIImageView = {
        let img  = UIImageView()
        img.setDimensions(width: 120, height: 100)
        img.image = #imageLiteral(resourceName: "blocket").withRenderingMode(.alwaysOriginal)
        return img
    }()
    
    private var promptTitle: UILabel = {
        let label = UILabel()
        label.text = "Title unknown"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private var promptDescription: UILabel = {
        let label = UILabel()
        label.text = "Description unknown"
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var loginButton = BlocketButton(text: "Log in to get started!")

    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(blocketImage)
        blocketImage.anchor(top: topAnchor)
        blocketImage.centerX(inView: self)
        
        addSubview(promptTitle)
        promptTitle.anchor(top: blocketImage.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 80, paddingLeft: 20, paddingRight: 20)
        
        addSubview(promptDescription)
        promptDescription.anchor(top: promptTitle.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 20, paddingRight: 20)
        
        addSubview(loginButton)
        loginButton.anchor(top: promptDescription.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 50, paddingRight: 50, height: 50)
        loginButton.centerX(inView: self)
        

        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
