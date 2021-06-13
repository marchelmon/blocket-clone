//
//  TappableView.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-12.
//

import UIKit

protocol TappableViewDelegate: class {
    func getUserLocation()
    func showAllCategories()
    func showAllLocations()
}

class TappableView: UIView {
    
    weak var delegate: TappableViewDelegate?
    
    var viewText: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var locationButton: UIButton = {
        let image = UIImage(systemName: "location.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(#colorLiteral(red: 0.04465086914, green: 0.5049166132, blue: 1, alpha: 1))
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setImage(image, for: .normal)
        button.setTitle(" GPS", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.04465086914, green: 0.5049166132, blue: 1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(handleLocation), for: .touchUpInside)
        button.setDimensions(width: 60, height: 30)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.04465086914, green: 0.5049166132, blue: 1, alpha: 1)
        button.layer.cornerRadius = 6
        return button
    }()
    
    private let arrowIcon: UIImageView = {
        let image = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysOriginal).withTintColor(.black)
        let iv = UIImageView()
        iv.image = image
        return iv
    }()
    
    init(placeholder: String, includeLocationButton: Bool = false) {
        super.init(frame: .zero)
        
        viewText.text = placeholder
        if !includeLocationButton { locationButton.isHidden = true}
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped)))
        
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        layer.cornerRadius = 6
        
        addSubview(viewText)
        viewText.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 20)
        
        addSubview(locationButton)
        locationButton.centerY(inView: self, leftAnchor: viewText.rightAnchor, paddingLeft: 20)
        
        addSubview(arrowIcon)
        arrowIcon.centerY(inView: self)
        arrowIcon.anchor(right: rightAnchor, paddingRight: 10)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    
    @objc func viewTapped() {
        if locationButton.isHidden {
            delegate?.showAllCategories()
        } else {
            delegate?.showAllLocations()
        }
    }
    
    @objc func handleLocation() {
        delegate?.getUserLocation()
    }

}




