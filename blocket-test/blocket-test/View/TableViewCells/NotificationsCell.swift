//
//  NotificationsCell.swift
//  blocket-test
//
//  Created by marchelmon on 2021-06-09.
//

import UIKit

class NotificationsCell: UITableViewCell {
    
    let toggle: UISwitch = {
        let toggle = UISwitch()
        toggle.onTintColor = #colorLiteral(red: 0.359662356, green: 0.8235294223, blue: 0.5010703752, alpha: 1)
        return toggle
    }()
    
    let cellText: UILabel = {
        let label = UILabel()
        label.text = "Tips, offers and news"
        label.numberOfLines = 2
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        contentView.addSubview(toggle)
        toggle.centerY(inView: self)
        toggle.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        
        contentView.addSubview(cellText)
        cellText.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 15, constant: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



