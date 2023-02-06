//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Harun Demirkaya on 6.02.2023.
//
// MARK: -Import Libaries
import UIKit

// MARK: -Menu Table View Cell Class
class WeatherTableViewCell: UITableViewCell {
    
    // MARK: -Define Identifier
    static let identifier = "WeatherTableViewCell"
    
    // MARK: -Run Init and Style
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
