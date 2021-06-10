//
//  AdCell.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-10.
//

import UIKit

class AdCell: UITableViewCell {
    
    //MARK: - Properties
    
    var ad: Ad! {
        didSet {
            configureCell()
        }
    }

    private let photo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 15
        return iv
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(white: 0.2, alpha: 0.9)
        label.numberOfLines = 2
        return label
    }()
    
    private let location: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .lightGray
        label.numberOfLines = 2
        return label
    }()
    
    private let priceTag: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = #colorLiteral(red: 0.359662356, green: 0.8235294223, blue: 0.5010703752, alpha: 1)
        label.numberOfLines = 2
        return label
    }()
    
    private let releaseTime: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .lightGray
        label.numberOfLines = 2
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        addSubview(photo)
        photo.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 10)
        photo.setDimensions(width: 90 * 1.5, height: 90)
        
        addSubview(title)
        title.anchor(top: topAnchor, left: photo.rightAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 15)
        
        addSubview(location)
        location.anchor(top: title.bottomAnchor, left: photo.rightAnchor, paddingTop: 5, paddingLeft: 10)
        
        addSubview(priceTag)
        priceTag.anchor(left: photo.rightAnchor, bottom: bottomAnchor, paddingLeft: 10, paddingBottom: 12)
        
        addSubview(releaseTime)
        releaseTime.anchor(bottom: bottomAnchor, right: rightAnchor, paddingBottom: 10, paddingRight: 15)

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Helpers
    
    func configureCell() {

        title.text = ad.title
        location.text = ad.placement
        priceTag.text = "\(ad.price)kr"
        photo.image = ad.photo
        
        releaseTime.text = "\(ad.publishDate), \(ad.publishTime)"
        
    }
    
}
