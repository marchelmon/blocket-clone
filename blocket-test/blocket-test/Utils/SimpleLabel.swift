//
//  BoldLabel.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-12.
//

import UIKit

class SimpleLabel: UILabel {
    
    init(text: String, fontSize: CGFloat, isBold: Bool) {
        super.init(frame: .zero)
        
        self.text = text
        font = isBold ? UIFont.boldSystemFont(ofSize: fontSize) : UIFont.systemFont(ofSize: fontSize)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
