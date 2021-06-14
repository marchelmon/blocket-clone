//
//  FilterSectionHeader.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-14.
//

import UIKit

class FilterSectionHeader: UIView {
    
    //MARK: - Properties
    
    private let header: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(white: 0.3, alpha: 0.9)
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    init(headerText: String) {
        super.init(frame: .zero)
        
        header.text = headerText
        
        backgroundColor = #colorLiteral(red: 0.9703362944, green: 0.9703362944, blue: 0.9703362944, alpha: 1)
        
        addSubview(header)
        header.anchor(left: leftAnchor, bottom: bottomAnchor, paddingLeft: 15, paddingBottom: 4)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
