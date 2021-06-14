//
//  FilterController.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-13.
//

import UIKit

private let filterCellIdentifier = "FilterCell"

class FilterController: UIViewController {
    
    //MARK: - Properties
    
    private let sortingData = ["Latest", "Oldest", "Cheapest", "Most expensive"]
    private lazy var sortingPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.tag = 0
        return picker
    }()
    
    private let advertiserData = ["All", "Private seller", "Company seller"]
    private lazy var advertiserPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.tag = 1
        return picker
    }()
    
    private let kindOfAdData = ["For sale", "For trade", "For rent", "Wish to rent", "To buy",]
    private lazy var kindOfAd: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.tag = 2
        return picker
    }()
    
    //PLATS
    //plats >
    //Angränsande län?
    //Nuvarande location GPS
    
    //KATEGORI
    //kategori >
    
    //OPTIONS
    // senaste / äldst / billigast / dyrast
    //Visa stora bilder? Toggle
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    
}


//MARK: - UITableViewDelegate / UITableViewDataSource

extension FilterController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0: return 4
        case 1: return 3
        case 2: return 5
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0: print("Data: \(sortingData[row])")
        case 1: print("Data: \(advertiserData[row])")
        case 2: print("Data: \(kindOfAdData[row])")
        default: print("Default selected")
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0: return sortingData[row]
        case 1: return advertiserData[row]
        case 2: return kindOfAdData[row]
        default: return "Unknown / Default"
        }
    }
    
}
