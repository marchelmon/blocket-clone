//
//  LocationButton.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-14.
//

import UIKit


class LocationButton: UIButton {
    
    
    //MARK: - Lifecycle
    
    init(color: UIColor) {
        super.init(frame: .zero)
        
        let image = UIImage(systemName: "location.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(color)
        titleLabel?.font = UIFont.systemFont(ofSize: 12)
        setImage(image, for: .normal)
        setTitle(" GPS", for: .normal)
        setTitleColor(color, for: .normal)
        setDimensions(width: 60, height: 30)
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = color.cgColor
        layer.cornerRadius = 6
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
