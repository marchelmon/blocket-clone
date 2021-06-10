//
//  TopView.swift
//  blocket-storyboards
//
//  Created by marchelmon on 2021-06-08.
//

import UIKit

class TopView: UIView {

    //MARK: - Properties
        
    var controllerType: ControllerType? {
        didSet {
            titleLabel.text = controllerType?.topLabel
        }
    }
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Untitled"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    private let underLine: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(underLine)
        underLine.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 1)
        
        addSubview(titleLabel)
        titleLabel.anchor(bottom: underLine.topAnchor, paddingBottom: 10)
        titleLabel.centerX(inView: self)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Actions

    
}
