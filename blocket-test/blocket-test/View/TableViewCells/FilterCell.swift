//
//  FilterCell.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-13.
//

import UIKit

class FilterCell: UITableViewCell {
    
    //MARK: - Properties
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let optionText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let toggle = UISwitch()
    
    let locationButton = LocationButton(color: #colorLiteral(red: 0.8075824873, green: 0.187832036, blue: 0.1575775297, alpha: 1))
    
    let arrowIcon: UIImageView = {
        let icon = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        let iv = UIImageView(image: icon)
        return iv
    }()
    
    //PLATS
    //plats >
    //Angränsande län?    Switch
    //Nuvarande location GPS-knapp
    
    //KATEGORI
    //kategori >
    
    //OPTIONS
    // senaste / äldst / billigast / dyrast
    //Visa stora bilder? Toggle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        toggle.isHidden = true
        locationButton.isHidden = true
        arrowIcon.isHidden = true
        
        addSubview(label)
        label.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 15)
        
        addSubview(arrowIcon)
        arrowIcon.centerY(inView: self)
        arrowIcon.anchor(right: rightAnchor, paddingRight: 15)
        
        contentView.addSubview(toggle)
        toggle.centerY(inView: self)
        toggle.anchor(right: rightAnchor, paddingRight: 15)
        
        contentView.addSubview(locationButton)
        locationButton.centerY(inView: self)
        locationButton.anchor(right: rightAnchor, paddingRight: 15)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
