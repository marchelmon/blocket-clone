//
//  FilterRow.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-14.
//

import UIKit

enum FilterRowType {
    case location
    case usingToggle
    case currentLocation
    case category
    case sorting
    case advertiserKind
    case adKind
}

protocol FilterRowDelegate: class {
    func showLocations()
    func askForLocation()
    func showCategories()
    func tappedPicker(pickerType: FilterRowType)
}

class FilterRow: UIView {
    
    //MARK: - Properties
    
    private let rowType: FilterRowType
    
    weak var delegate: FilterRowDelegate?
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let optionText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = ""
        return label
    }()
    
    private let underLine: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    private let overLine: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    private let arrow: UIImageView = {
        let arrow = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        let iv = UIImageView(image: arrow)
        return iv
    }()
    
    private let toggle = UISwitch()
    private let locationButton = LocationButton(color: #colorLiteral(red: 0.8075824873, green: 0.187832036, blue: 0.1575775297, alpha: 1))
    
    //MARK: - LifeCycle
    
    init(rowType: FilterRowType, delegate: FilterRowDelegate, labelText: String, isFirstInSection: Bool = false, isLastInSection: Bool = false) {
        self.rowType = rowType
        super.init(frame: .zero)
        
        toggle.onTintColor = #colorLiteral(red: 0.3046020282, green: 0.6853585025, blue: 0.3180214897, alpha: 1)
        
        self.delegate = delegate
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTappedRow)))
        locationButton.addTarget(self, action: #selector(handleTappedRow), for: .touchUpInside)
        
        label.text = labelText
                
        addSubview(label)
        label.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 15)
        
        addSubview(underLine)
        if isLastInSection {
            underLine.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 1)
        } else {
            underLine.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 15, height: 1)
        }
        if isFirstInSection {
            addSubview(overLine)
            overLine.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 1)
        }

        configureItems()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Actions
    
    @objc func handleTappedRow() {
        switch rowType {

        case .location: delegate?.showLocations()
        case .usingToggle: toggle.isOn = !toggle.isOn
        case .currentLocation: delegate?.askForLocation()
        case .category: delegate?.showCategories()
        default: delegate?.tappedPicker(pickerType: rowType)
        }
    }
    
    //MARK: - Helpers
    
    func configureItems() {
        switch rowType {
        case .location: configureWithArrow()
        case .currentLocation: configureCurrent()
        case .category: configureWithArrow()
        case .sorting, .advertiserKind, .adKind: configureForPicker()
        case .usingToggle: configureWithToggle()
        }
    }
    func configureWithToggle() {
        addSubview(toggle)
        toggle.centerY(inView: self)
        toggle.anchor(right: rightAnchor, paddingRight: 15)
    }
    func configureCurrent() {
        addSubview(locationButton)
        locationButton.centerY(inView: self)
        locationButton.anchor(right: rightAnchor, paddingRight: 15)
    }
    func configureWithArrow() {
        addSubview(arrow)
        arrow.centerY(inView: self)
        arrow.anchor(right: rightAnchor, paddingRight: 15)
        
        addSubview(optionText)
        optionText.centerY(inView: self)
        optionText.anchor(right: arrow.leftAnchor)
    }
    func configureForPicker() {
        addSubview(optionText)
        optionText.centerY(inView: self)
        optionText.anchor(right: rightAnchor, paddingRight: 15)
        if rowType == .sorting { optionText.text = "Latest" }
        if rowType == .advertiserKind { optionText.text = "Private" }
        if rowType == .adKind { optionText.text = "For sale" }
    }

}
