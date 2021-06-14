//
//  FilterController.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-13.
//

import UIKit

private let filterCellIdentifier = "FilterCell"

class FilterController: UIViewController, UIScrollViewDelegate {
    
    //MARK: - Properties
    
    private var categoryIndex = 0
    private var locationIndex = 0
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: view.frame.width, height: 1000)
        scroll.delegate = self
        return scroll
    }()
    
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
    
    private let locationSectionHeader = FilterSectionHeader(headerText: "LOCATION")
    private let categorySectionHeader = FilterSectionHeader(headerText: "CATEGORY")
    private let pickersSectionHeader = FilterSectionHeader(headerText: "SORTING AND KIND")
    private let onlyShowSectionHeader = FilterSectionHeader(headerText: "SHOW")
    
    private lazy var locationRow = FilterRow(rowType: .location, delegate: self, labelText: "Location", isFirstInSection: true)
    private lazy var nearbyRow = FilterRow(rowType: .usingToggle, delegate: self, labelText: "Nearby areas")
    private lazy var currentLocationRow = FilterRow(rowType: .currentLocation, delegate: self, labelText: "Find current location", isLastInSection: true)
    private lazy var categoryRow = FilterRow(rowType: .category, delegate: self, labelText: "Category", isFirstInSection: true, isLastInSection: true)
    private lazy var sortingRow = FilterRow(rowType: .sorting, delegate: self, labelText: "Sort", isFirstInSection: true)
    private lazy var advertiserKindRow = FilterRow(rowType: .advertiserKind, delegate: self, labelText: "Advertiser kind")
    private lazy var adKindRow = FilterRow(rowType: .adKind, delegate: self, labelText: "Ad kind", isLastInSection: true)
    private lazy var loweredPriceRow = FilterRow(rowType: .usingToggle, delegate: self, labelText: "Lowered price only", isFirstInSection: true)
    private lazy var largeImagesRow = FilterRow(rowType: .usingToggle, delegate: self, labelText: "Large Images", isLastInSection: true)
        
    private let setFilterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Set Filter", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), for: .normal)
        return button
    }()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Filter"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(dismissFilter))
        navigationItem.backButtonTitle = "Cancel"
        navigationController?.navigationItem.backBarButtonItem = .init(title: "Cancel", style: .done, target: self, action: #selector(dismissFilter))
        
        configureSectionsAndRows()
     
        view.addSubview(setFilterButton)
        setFilterButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 15, paddingRight: 15, height: 50)
    }
    
    
    //MARK: - Actions
    
    @objc func dismissFilter() {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Helpers
    
    func configureSectionsAndRows() {
        
        view.addSubview(scrollView)
        scrollView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
        
        //LOCATION
        scrollView.addSubview(locationSectionHeader)
        locationSectionHeader.anchor(top: scrollView.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 60)
        
        let locationStack = UIStackView(arrangedSubviews: [locationRow, nearbyRow, currentLocationRow])
        locationStack.axis = .vertical
        
        scrollView.addSubview(locationStack)
        locationStack.anchor(top: locationSectionHeader.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
        //CATEGORY
        scrollView.addSubview(categorySectionHeader)
        categorySectionHeader.anchor(top: locationStack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 60)
        
        scrollView.addSubview(categoryRow)
        categoryRow.anchor(top: categorySectionHeader.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
        //PICKERS
        scrollView.addSubview(pickersSectionHeader)
        pickersSectionHeader.anchor(top: categoryRow.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 60)
        
        let pickerStack = UIStackView(arrangedSubviews: [sortingRow, advertiserKindRow, adKindRow])
        pickerStack.axis = .vertical
        
        scrollView.addSubview(pickerStack)
        pickerStack.anchor(top: pickersSectionHeader.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
        //SHOW ONLY SECTION
        scrollView.addSubview(onlyShowSectionHeader)
        onlyShowSectionHeader.anchor(top: pickerStack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 60)
        
        scrollView.addSubview(loweredPriceRow)
        loweredPriceRow.anchor(top: onlyShowSectionHeader.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
        scrollView.addSubview(largeImagesRow)
        largeImagesRow.anchor(top: loweredPriceRow.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor)
        
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

extension FilterController: FilterRowDelegate {
    func showLocations() {
        let controller = AdOptionsController(optionType: .location, selectedIndex: locationIndex)
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func askForLocation() {

    }
    
    func showCategories() {
        let controller = AdOptionsController(optionType: .category, selectedIndex: categoryIndex)
        controller.delegate = self
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tappedPicker(pickerType: FilterRowType) {

    }    
}

extension FilterController: AdOptionsControllerDelegate {
    func didSelectCategory(withIndex index: Int) {
        categoryRow.optionText.text = Service.shared.categories[index]
        categoryIndex = index

        navigationController?.popViewController(animated: true)
    }
    
    func didSelectLocation(withIndex index: Int) {
        locationRow.optionText.text = Service.shared.locations[index]
        locationIndex = index
        
        navigationController?.popViewController(animated: true)
    }
}
