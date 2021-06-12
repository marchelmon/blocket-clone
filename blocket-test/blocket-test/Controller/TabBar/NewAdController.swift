//
//  NewAdController.swift
//  blocket-storyboards
//
//  Created by marchelmon on 2021-06-08.
//

import UIKit

class NewAdController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var scrollView: UIScrollView!
    
    private let imagePicker = UIImagePickerController()
    
    private let adKindLarge: UILabel = {
        let label = UILabel()
        label.text = "What would you like to sell?"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    private let imagesLabel: UILabel = {
        let label = UILabel()
        label.text = "Images"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
        
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        
        
        configureUI()
    }
    
    
    //MARK: - Actions
    
    @objc func handleSelectPhoto(sender: UIButton) {
        
    }
    
    
    //MARK: - Helpers
    
    func configureUI() {
        scrollView.addSubview(adKindLarge)
        adKindLarge.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, paddingTop: 30, paddingLeft: 15)
        
        scrollView.addSubview(imagesLabel)
        imagesLabel.anchor(top: adKindLarge.bottomAnchor, left: scrollView.leftAnchor, paddingTop: 10, paddingLeft: 15)
        
        configureImageButtons()
    }
    
    func configureImageButtons() {
        let button1 = createButton(0)
        let button2 = createButton(1)
        let button3 = createButton(2)
        let button4 = createButton(3)
        let button5 = createButton(4)
        let button6 = createButton(5)
        
        let firstStack = UIStackView(arrangedSubviews: [button1, button2, button3])
        let secondStack = UIStackView(arrangedSubviews: [button4, button5, button6])
        firstStack.distribution = .fillEqually
        firstStack.spacing = 10
        secondStack.distribution = .fillEqually
        secondStack.spacing = 10
        
        let stack = UIStackView(arrangedSubviews: [firstStack, secondStack])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        
        
        scrollView.addSubview(stack)
        stack.anchor(top: imagesLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 7, paddingLeft: 20, paddingRight: 20, height: 200)
        
    }
    
    func createButton(_ index: Int) -> UIButton {
        let button = UIButton(type: .system)
        let buttonTitle = index == 0 ? "Cover Image" : "Select Image"
        
        button.setTitle(buttonTitle, for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        button.clipsToBounds = true
        button.imageView?.contentMode = .scaleAspectFill
        button.tag = index
        
        return button
    }
    
}
