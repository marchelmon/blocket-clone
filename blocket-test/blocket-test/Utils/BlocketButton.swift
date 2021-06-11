//
//  BlocketButton.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-11.
//

import UIKit

class BlocketButton: UIButton {
    
    
    init(text: String, color: UIColor = #colorLiteral(red: 0.359662356, green: 0.8235294223, blue: 0.5010703752, alpha: 1), textColor: UIColor = .white, image: UIImage? = nil, hasBorder: Bool = false) {
        super.init(frame: .zero)
        
        setTitle(text, for: .normal)
        setTitleColor(textColor, for: .normal)
        backgroundColor = color
        setImage(image, for: .normal)
        layer.cornerRadius = 6
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        if hasBorder {
            layer.borderWidth = 2
            layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
