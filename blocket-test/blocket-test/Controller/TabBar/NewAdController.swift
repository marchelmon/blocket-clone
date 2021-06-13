//
//  NewAdController.swift
//  blocket-storyboards
//
//  Created by marchelmon on 2021-06-08.
//

import UIKit

class NewAdController: UIViewController {

    //MARK: - Properties
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.delegate = self
        scroll.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height + 300)
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    private let imagePicker = UIImagePickerController()
    private var imageindex = 0
    
    private var buttons = [UIButton]()
    
    private let adKindLarge = SimpleLabel(text: "What would you like to sell?", fontSize: 22, isBold: true)
    private let contactsLarge = SimpleLabel(text: "Contacts", fontSize: 22, isBold: true)
    private let imagesLabel = SimpleLabel(text: "Images", fontSize: 15, isBold: true)
    private let categoryLabel = SimpleLabel(text: "Category", fontSize: 15, isBold: true)
    private let locationLabel = SimpleLabel(text: "Location", fontSize: 15, isBold: true)
    
    private let categoryTapView = TappableView(placeholder: "Select Category", includeLocationButton: false)
    private let locationTapView = TappableView(placeholder: "Select Location", includeLocationButton: true)
    
    let nameLabel = SimpleLabel(text: "Name", fontSize: 15, isBold: true)
    let emailLabel = SimpleLabel(text: "Email", fontSize: 15, isBold: true)
    let phoneLabel = SimpleLabel(text: "Phone Number", fontSize: 15, isBold: true)
    
    private lazy var nameField = createTextField(placeholder: "")
    private lazy var emailField = createTextField(placeholder: "john@doe.com")
    private lazy var phoneField = createTextField(placeholder: "+46 ...")
    
    private lazy var phoneToggle = createPhoneToggleView(text: "Hide phone number")
    private lazy var tempToggle = createPhoneToggleView(text: "Temporary phone number")
    
    private let previewButton = BlocketButton(text: "Preview Ad", color: .white, textColor: UIColor(white: 0.1, alpha: 0.9), hasBorder: true)
    private let continueButton = BlocketButton(text: "Continue", color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), textColor: .white)
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        categoryTapView.delegate = self
        locationTapView.delegate = self
                
        configureUI()
    }
    
    
    //MARK: - Actions
    
    @objc func handleSelectPhoto(sender: UIButton) {
        imageindex = sender.tag
    }
    
    
    //MARK: - Helpers
    
    func configureUI() {
        view.addSubview(scrollView)
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
        
        scrollView.addSubview(adKindLarge)
        adKindLarge.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, paddingTop: 30, paddingLeft: 15)
        
        //IMAGES
        scrollView.addSubview(imagesLabel)
        imagesLabel.anchor(top: adKindLarge.bottomAnchor, left: scrollView.leftAnchor, paddingTop: 10, paddingLeft: 15)
        
        let imageButtonStack = createImageButtonsStack()
        scrollView.addSubview(imageButtonStack)
        imageButtonStack.anchor(top: imagesLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 7, paddingLeft: 20, paddingRight: 20, height: 200)
        
        //AD INFO
        scrollView.addSubview(categoryLabel)
        categoryLabel.anchor(top: imageButtonStack.bottomAnchor, left: scrollView.leftAnchor, paddingTop: 12, paddingLeft: 15)
        
        scrollView.addSubview(categoryTapView)
        categoryTapView.anchor(top: categoryLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingRight: 20, height: 50)

        scrollView.addSubview(locationLabel)
        locationLabel.anchor(top: categoryTapView.bottomAnchor, left: view.leftAnchor, paddingTop: 12, paddingLeft: 15)

        scrollView.addSubview(locationTapView)
        locationTapView.anchor(top: locationLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingRight: 20, height: 50)

        //CONTACTS
        scrollView.addSubview(contactsLarge)
        contactsLarge.anchor(top: locationTapView.bottomAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 15)

        scrollView.addSubview(nameLabel)
        nameLabel.anchor(top: contactsLarge.bottomAnchor, left: view.leftAnchor, paddingTop: 15, paddingLeft: 15)

        scrollView.addSubview(nameField)
        nameField.anchor(top: nameLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 15, paddingRight: 15, height: 50)

        scrollView.addSubview(emailLabel)
        emailLabel.anchor(top: nameField.bottomAnchor, left: view.leftAnchor, paddingTop: 12, paddingLeft: 15)

        scrollView.addSubview(emailField)
        emailField.anchor(top: emailLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 15, paddingRight: 15, height: 50)

        scrollView.addSubview(phoneLabel)
        phoneLabel.anchor(top: emailField.bottomAnchor, left: view.leftAnchor, paddingTop: 12, paddingLeft: 15)

        scrollView.addSubview(phoneField)
        phoneField.anchor(top: phoneLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 15, paddingRight: 15, height: 50)

        //PHONE TOGGLE
        scrollView.addSubview(phoneToggle)
        phoneToggle.anchor(top: phoneField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 15, paddingRight: 15, height: 30)

        scrollView.addSubview(tempToggle)
        tempToggle.anchor(top: phoneToggle.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 15, paddingLeft: 15, paddingRight: 15, height: 30)

        //ACTION BUTTONS
        scrollView.addSubview(previewButton)
        previewButton.anchor(top: tempToggle.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 25, paddingLeft: 15, paddingRight: 15, height: 50)

        scrollView.addSubview(continueButton)
        continueButton.anchor(top: previewButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 15, paddingLeft: 15, paddingRight: 15, height: 50)
        
    }
    
    
    func createPhoneToggleView(text: String) -> UIView {
        let phoneView = UIView()
        let label = SimpleLabel(text: text, fontSize: 15, isBold: true)
        let toggle = UISwitch()
        
        phoneView.addSubview(label)
        label.anchor(top: phoneView.topAnchor, left: phoneView.leftAnchor, paddingTop: 10)
        
        phoneView.addSubview(toggle)
        toggle.centerY(inView: label)
        toggle.anchor(right: phoneView.rightAnchor)

        return phoneView
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
        
        if index != 0 { button.setTitleColor(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)}
        button.setTitle(buttonTitle, for: .normal)
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
    
    func createTextField(placeholder: String) -> UITextField {
        let tf = UITextField()
        let spacer = UIView()
        spacer.setDimensions(width: 15, height: 50)
        tf.leftView = spacer
        tf.leftViewMode = .always
        tf.placeholder = placeholder
        tf.layer.cornerRadius = 5
        tf.layer.borderWidth = 1
        tf.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return tf
    }
    
}

//MARK: - PickerDelegate and NavigationDelegate
extension NewAdController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - UIScrollViewDelegate
extension NewAdController: UIScrollViewDelegate {
}

extension NewAdController: TappableViewDelegate {
    func getUserLocation() {

    }
    func showAllCategories() {
        let controller = AdOptionsController(optionType: .category)
        navigationController?.pushViewController(controller, animated: true)
    }
    func showAllLocations() {
        let controller = AdOptionsController(optionType: .location)
        navigationController?.pushViewController(controller, animated: true)
        
    }
}

