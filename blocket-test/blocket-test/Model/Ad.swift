//
//  Ad.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-09.
//

import Foundation

struct Ad {
    var title: String
    var placement: String
    var price: String
    var comparisonTime: Date
    var publishDate = ""
    var publishTime = ""
    
    
    init(title: String, placement: String, price: String, comparisonTime: Date) {
        self.title = title
        self.placement = placement
        self.price = price
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
