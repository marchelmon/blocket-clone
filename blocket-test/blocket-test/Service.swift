//
//  Service.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-09.
//

import UIKit

class Service {
    
    static let shared = Service()
    
    
    let ad1 = Ad(title: "Audi RS6, 2017", placement: "Göteborg", price: "589 000", comparisonTime: Date(timeIntervalSinceNow: -100000))
    let ad2 = Ad(title: "Byrå", placement: "Stockholm", price: "999", comparisonTime: Date(timeIntervalSinceNow: -300000))
    let ad3 = Ad(title: "Stol", placement: "Malmö", price: "100", comparisonTime: Date(timeIntervalSinceNow: -600000))
    let ad4 = Ad(title: "Cykel", placement: "Malmö", price: "500", comparisonTime: Date(timeIntervalSinceNow: -800000))
    let ad5 = Ad(title: "TV 65\"", placement: "Malmö", price: "1850", comparisonTime: Date(timeIntervalSinceNow: -1000000))

    
    lazy var ads: [Ad] = [ad1, ad2, ad3, ad4, ad5]
    
}
