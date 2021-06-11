//
//  AdController.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-10.
//

import UIKit

class AdController: UIViewController, UIScrollViewDelegate {
    
    //MARK: - Properties
    
    var ad: Ad? {
        didSet {
            configureAd()
        }
    }
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.delegate = self
        scroll.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height + 200)
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()

    private lazy var photo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let adTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = UIColor(white: 0.1, alpha: 0.9)
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
        label.font = UIFont.boldSystemFont(ofSize: 22)
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
    
    private let adDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
        
    private let messageButtonImage = UIImage(systemName: "envelope")?.withTintColor(.white).withRenderingMode(.alwaysOriginal)
    private lazy var messageButton = BlocketButton(text: " Send Message", image: messageButtonImage)
    private let phoneButton = BlocketButton(text: "Show phone number",color: .white, textColor: UIColor(white: 0.1, alpha: 0.9), hasBorder: true)
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
        
        scrollView.addSubview(photo)
        photo.centerX(inView: scrollView)
        photo.anchor(top: scrollView.topAnchor, height: 300)

        let bottomLine = UIView()
        bottomLine.backgroundColor = .lightGray
        view.addSubview(bottomLine)
        bottomLine.anchor(top: photo.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 1)

        view.addSubview(adTitle)
        adTitle.anchor(top: bottomLine.bottomAnchor, paddingTop: 10)
        adTitle.centerX(inView: view)
        
        view.addSubview(priceTag)
        priceTag.anchor(top: adTitle.bottomAnchor, paddingTop: 30)
        priceTag.centerX(inView: view)
        
        guard let ad = ad else { return }
        let publishedRow = ListRow(label: "Published", info: ad.publishDate)
        
        view.addSubview(publishedRow)
        publishedRow.anchor(top: priceTag.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 15)
        
        let locationRow = ListRow(label: "Location", info: ad.placement)
        
        view.addSubview(locationRow)
        locationRow.anchor(top: publishedRow.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
        let categoryRow = ListRow(label: "Category", info: ad.category.description)
        
        view.addSubview(categoryRow)
        categoryRow.anchor(top: locationRow.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)

        view.addSubview(adDescription)
        adDescription.anchor(top: categoryRow.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                             paddingTop: 30, paddingLeft: 15, paddingRight: 15)

        view.addSubview(messageButton)
        messageButton.anchor(top: adDescription.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                             paddingTop: 40, paddingLeft: 15, paddingRight: 15, height: 50)
        
        view.addSubview(phoneButton)
        phoneButton.anchor(top: messageButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                                 paddingTop: 12, paddingLeft: 15, paddingRight: 15, height: 50)
        
    }
    
    
    //MARK: - Helpers
    
    func configureAd() {
        guard let ad = ad else { return }
        photo.image = ad.photo
        adTitle.text = ad.title
        location.text = ad.placement
        priceTag.text = "\(ad.price)kr"
        adDescription.text = ad.description

    }
 
}

