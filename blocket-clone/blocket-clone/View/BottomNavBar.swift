//
//  BottomNavBar.swift
//  blocket-clone
//
//  Created by marchelmon on 2021-06-07.
//

import UIKit

class BottomNavBar: UIView {
    
    //MARK: - Properties
    let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let bajs: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("bajs", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configureUI() {
        backgroundColor = .systemBlue
        
        let stack = UIStackView(arrangedSubviews: [searchButton, bajs, searchButton, searchButton, searchButton])
        
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        
        addSubview(stack)
        stack.centerY(inView: self)
        stack.anchor(left: leftAnchor, right: rightAnchor, paddingLeft: 10, paddingRight: 10)
        
    }
    
    
}
