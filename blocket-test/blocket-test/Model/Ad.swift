//
//  Ad.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-09.
//

import UIKit

enum Category: CustomStringConvertible {
    case vehicle
    case home
    case residence
    case personal
    case electronics
    case leisure
    case business
    case other

    var description: String {
        switch self {
        case .vehicle:
            return "Vehicle"
        case .home:
            return "For the home"
        case .residence:
            return "Residence"
        case .personal:
            return "Personal"
        case .electronics:
            return "Electronics"
        case .leisure:
            return "Leisure"
        case .business:
            return "Business"
        case .other:
            return "Other"
        }
    }
    
    
}

struct Ad {
    var title: String
    var placement: String
    var price: String
    var comparisonTime: Date
    var publishDate = ""
    var publishTime = ""
    var photo: UIImage
    var category: Category
    var description = "Just a really nice thing!"
    
    
    init(title: String, placement: String, price: String, photo: UIImage, comparisonTime: Date, category: Category = .other, description: String) {
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
