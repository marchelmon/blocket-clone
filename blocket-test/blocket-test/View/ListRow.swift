//
//  ListRow.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-10.
//

import UIKit

class ListRow: UIView {
    
    //MARK: - Properties
    
    private let rowLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    } ()
    
    private let rowInfo: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(white: 0.1, alpha: 0.8)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let bottomLine: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    
    init(label: String, info: String) {
        rowLabel.text = label
        rowInfo.text = info
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        addSubview(rowLabel)
        rowLabel.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 15)
        
        addSubview(rowInfo)
        rowInfo.centerY(inView: self)
        rowInfo.anchor(right: rightAnchor, paddingRight: 15)
        
        addSubview(bottomLine)
        bottomLine.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 15, height: 1)
        
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
