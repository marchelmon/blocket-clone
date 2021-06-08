//
//  BottomNavBar.swift
//  blocket-clone
//
//  Created by marchelmon on 2021-06-07.
//

import UIKit

class BottomNavBar: UIStackView {
    
    //MARK: - Properties
    let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.green, for: .normal)
        return button
    }()
    
    let bajs: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("bajs", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(handleBajs), for: .touchUpInside)
        return button
    }()
    
    private let swipeImage: UIImage? = {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 30)
        let image = UIImage(systemName: "film", withConfiguration: imageConfig)
        return image
    }()

    private lazy var swipeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(swipeImage?.withTintColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), renderingMode: .alwaysOriginal), for: .normal)
        button.setTitle("Swipe", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), for: .normal)
        return button
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        configureUI()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Actions
    
    @objc func handleBajs() {
        print("ajs")
    }
    
    
    //MARK: - Helpers
    
    func configureUI() {
        
        [searchButton, UIView() ,bajs, UIView(), swipeButton].forEach { view in
            addArrangedSubview(view)
        }
        distribution = .equalCentering
        
        heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        layoutMargins = .init(top: 0, left: 7, bottom: 0, right: 7)
        isLayoutMarginsRelativeArrangement = true
        
        
    }
    

    
}
