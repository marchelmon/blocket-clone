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
    
    lazy var ad1 = Ad(title: "Volvo V60, 2019", placement: "Göteborg", price: "589 000",
                      photo: bil, comparisonTime: Date(timeIntervalSinceNow: -10000),
                      category: "Cars", description: "Hej! *Nyservad på Skobes i Vetlanda 2021-05-14 med olja, alla filter samt ny vindruta.\n*Kamrem bytt på 17,320 mil även detta gjort på Skobes i Vetlanda.*Dokumentation finns på alla service tillfällen. * Nya sommardäck Augusti 2020 - GoodYear EagleF1 Asymetric 5. * Volvo Ocean Race Fälgar 18 som vi köpte till bilen under svärfars ägo.*Vinterhjul Volvo Original *Tonade Rutor hos Mr.Cap Navigator, Värmare på tidur, Helljusassistent, Bluetooth allt för en bra komfort.Går fantastiskt fint i motor & låda, välvårdad både av nuvarande samt tidigare ägare. 2:a brukaren, första var ett företag (gått som tjänstebil) *FINANS GÅR ATT ORDNA*")
    lazy var ad2 = Ad(title: "Byrå", placement: "Stockholm", price: "999",
                      photo: byra, comparisonTime: Date(timeIntervalSinceNow: -100000),
                      category: "Furniture", description: "Just a really nice storage thing")
    lazy var ad3 = Ad(title: "Stol", placement: "Malmö", price: "100",
                      photo: stol, comparisonTime: Date(timeIntervalSinceNow: -200000),
                      category: "Furniture", description: "Just a really nice chair")
    lazy var ad4 = Ad(title: "Cykel", placement: "Göteborg", price: "500",
                      photo: cykel, comparisonTime: Date(timeIntervalSinceNow: -300000),
                      category: "Leisure", description: "A really nice bike! Not Stolen!")
    lazy var ad5 = Ad(title: "TV 40\"", placement: "Göteborg", price: "1 850",
                      photo: tv, comparisonTime: Date(timeIntervalSinceNow: -400000),
                      category: "Electronics", description: "Please buy it, please")
    lazy var ad6 = Ad(title: "Laptop", placement: "Göteborg", price: "90",
                      photo: laptop, comparisonTime: Date(timeIntervalSinceNow: -500000),
                      category: "Electronics", description: "A 1000 year old laptop")

    
    lazy var ads: [Ad] = [ad1, ad2, ad3, ad4, ad5, ad6]
    
    
    let categories: [String] = [
        "Vehicle",
        "For the home",
        "Residence",
        "Personal",
        "Electronics",
        "Leisure & Hobbies",
        "Business",
        "Other",
    ]
    
    
}
