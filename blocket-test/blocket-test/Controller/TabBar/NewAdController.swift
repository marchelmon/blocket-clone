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
    private var imageindex = 0
    
    private var buttons = [UIButton]()
    
    private let adKindLarge: UILabel = {
        let label = UILabel()
        label.text = "What would you like to sell?"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    private let contactsLarge: UILabel = {
        let label = UILabel()
        label.text = "Contacts"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    private let imagesLabel: UILabel = {
        let label = UILabel()
        label.text = "Images"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "Location"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    private let categoryTapView = TappableView(placeholder: "Select Category", includeLocationButton: false)
    private let locationTapView = TappableView(placeholder: "Select Location", includeLocationButton: true)
    
        
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        categoryTapView.delegate = self
        locationTapView.delegate = self
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        
        configureUI()
    }
    
    
    //MARK: - Actions
    
    @objc func handleSelectPhoto(sender: UIButton) {
        imageindex = sender.tag
    }
    
    
    //MARK: - Helpers
    
    func configureUI() {
        scrollView.addSubview(adKindLarge)
        adKindLarge.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, paddingTop: 30, paddingLeft: 15)
        
        scrollView.addSubview(imagesLabel)
        imagesLabel.anchor(top: adKindLarge.bottomAnchor, left: scrollView.leftAnchor, paddingTop: 10, paddingLeft: 15)
        
        let imageButtonStack = createImageButtonsStack()
        scrollView.addSubview(imageButtonStack)
        imageButtonStack.anchor(top: imagesLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 7, paddingLeft: 20, paddingRight: 20, height: 200)
        
        view.addSubview(categoryLabel)
        categoryLabel.anchor(top: imageButtonStack.bottomAnchor, left: scrollView.leftAnchor, paddingTop: 12, paddingLeft: 15)
        
        view.addSubview(categoryTapView)
        categoryTapView.anchor(top: categoryLabel.bottomAnchor, left: scrollView.leftAnchor, right: scrollView.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingRight: 20, height: 50)
        
        view.addSubview(locationLabel)
        locationLabel.anchor(top: categoryTapView.bottomAnchor, left: scrollView.leftAnchor, paddingTop: 12, paddingLeft: 15)
        
        view.addSubview(locationTapView)
        locationTapView.anchor(top: locationLabel.bottomAnchor, left: scrollView.leftAnchor, right: scrollView.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingRight: 20, height: 50)
        
        view.addSubview(contactsLarge)
        contactsLarge.anchor(top: locationTapView.bottomAnchor, left: scrollView.leftAnchor)
        
    }
    
    func createImageButtonsStack() -> UIStackView {
        let button1 = createButton(0)
        let button2 = createButton(1)
        let button3 = createButton(2)
        let button4 = createButton(3)
        let button5 = createButton(4)
        let button6 = createButton(5)
        
        buttons = [button1, button2, button3, button4, button5, button6]
        
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
    
        return stack
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


//MARK: - PickerDelegate and NavigationDelegate
extension NewAdController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        dismiss(animated: true, completion: nil)
    }
}


extension NewAdController: TappableViewDelegate {
    func getUserLocation() {
        print("Get locstion")
    }
    func showAllCategories() {
        print("Get categories")
    }
    func showAllLocations() {
        print("Get locations")
    }
}
