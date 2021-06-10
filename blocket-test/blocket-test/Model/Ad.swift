//
//  Ad.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-09.
//

import UIKit

struct Ad {
    var title: String
    var placement: String
    var price: String
    var comparisonTime: Date
    var publishDate = ""
    var publishTime = ""
    var photo: UIImage
    var category: String
    var description = "Just a really nice thing!"
    
    
    init(title: String, placement: String, price: String, photo: UIImage, comparisonTime: Date, category: String = "Any", description: String) {
        self.title = title
        self.placement = placement
        self.price = price
        self.category = category
        self.description = description
        self.photo = photo
        self.comparisonTime = comparisonTime
        
        var i = 0
        for char in comparisonTime.description {
            if i < 10 {
                publishDate.append(char)
            } else if i > 10 && i < 16 {
                publishTime.append(char)
            }
            i += 1
        }        
    }
    
}
