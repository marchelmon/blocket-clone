//
//  SettingsCell.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-09.
//

import UIKit


class SettingsCell: UITableViewCell {
    
    //MARK: - Properties
    
    private let rightArrowButton: UIButton = {
        let button = UIButton(type: .system)
        let img = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        button.setImage(img, for: .normal)
        return button
    }()
    
    var title: UILabel = {
        let label = UILabel()
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
    
        addSubview(rightArrowButton)
        rightArrowButton.centerY(inView: self)
        rightArrowButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        
        addSubview(title)
        title.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 15)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
}







