//
//  Service.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-09.
//

import UIKit

class Service {
    
    static let shared = Service()
    
    let bil = #imageLiteral(resourceName: "v60")
    let cykel = #imageLiteral(resourceName: "begagnad-cykel")
    let stol = #imageLiteral(resourceName: "stol")
    let byra = #imageLiteral(resourceName: "byra")
    let tv = #imageLiteral(resourceName: "tv")
    let laptop = #imageLiteral(resourceName: "laptop")
    
    lazy var ad1 = Ad(title: "Volvo V60, 2019", placement: "Göteborg", price: "589 000", photo: bil, comparisonTime: Date(timeIntervalSinceNow: -10000))
    lazy var ad2 = Ad(title: "Byrå", placement: "Stockholm", price: "999", photo: byra, comparisonTime: Date(timeIntervalSinceNow: -100000))
    lazy var ad3 = Ad(title: "Stol", placement: "Malmö", price: "100", photo: stol, comparisonTime: Date(timeIntervalSinceNow: -200000))
    lazy var ad4 = Ad(title: "Cykel", placement: "Göteborg", price: "500", photo: cykel, comparisonTime: Date(timeIntervalSinceNow: -300000))
    lazy var ad5 = Ad(title: "TV 40\"", placement: "Göteborg", price: "1 850", photo: tv, comparisonTime: Date(timeIntervalSinceNow: -400000))
    lazy var ad6 = Ad(title: "Laptop", placement: "Göteborg", price: "90", photo: laptop, comparisonTime: Date(timeIntervalSinceNow: -500000))

    
    lazy var ads: [Ad] = [ad1, ad2, ad3, ad4, ad5, ad6]
    
}
