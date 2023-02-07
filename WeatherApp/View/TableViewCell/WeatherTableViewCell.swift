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
    
    // MARK: -ImageViews Defined
    var imgViewBackground: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "cell-background"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var imgMidRain: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "mid-rain"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    // MARK: -Labels Defined
    var lblHighHeat: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "H:24°"
        label.font = UIFont.fontSFProDisplay(size: 15)
        label.textAlignment = .center
        label.textColor = .white.withAlphaComponent(0.6)
        return label
    }()
    
    var lblLowHeat: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "L:18°"
        label.font = UIFont.fontSFProDisplay(size: 15)
        label.textAlignment = .center
        label.textColor = .white.withAlphaComponent(0.6)
        return label
    }()
    
    var lblCityName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "İstanbul, Türkiye"
        label.font = UIFont.fontSFProDisplay(size: 15)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var lblWeatherState: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mid Rain"
        label.font = UIFont.fontSFProDisplay(size: 15)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    // MARK: -Run Init and Style
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        backgroundView = imgViewBackground
        backgroundView?.cellBackgroundViewConstraints(self)
        backgroundView?.layoutIfNeeded()
        
        textLabel?.font = UIFont.fontSFProDisplay(size: 64)
        textLabel?.translatesAutoresizingMaskIntoConstraints = false
        textLabel?.leadingAnchor.constraint(equalTo: imgViewBackground.leadingAnchor, constant: 20).isActive = true
        textLabel?.topAnchor.constraint(equalTo: imgViewBackground.topAnchor, constant: 28).isActive = true
        
        
        addSubview(lblHighHeat)
        lblHighHeat.topAnchor.constraint(equalTo: textLabel!.bottomAnchor, constant: 26).isActive = true
        lblHighHeat.leadingAnchor.constraint(equalTo: textLabel!.leadingAnchor).isActive = true
        lblHighHeat.layoutIfNeeded()
        
        addSubview(lblLowHeat)
        lblLowHeat.leadingAnchor.constraint(equalTo: lblHighHeat.trailingAnchor, constant: 10).isActive = true
        lblLowHeat.topAnchor.constraint(equalTo: lblHighHeat.topAnchor).isActive = true
        lblLowHeat.layoutIfNeeded()
        
        addSubview(lblCityName)
        lblCityName.topAnchor.constraint(equalTo: lblHighHeat.bottomAnchor, constant: 5).isActive = true
        lblCityName.leadingAnchor.constraint(equalTo: lblHighHeat.leadingAnchor).isActive = true
        lblCityName.bottomAnchor.constraint(equalTo: imgViewBackground.bottomAnchor, constant: -20).isActive = true
        lblCityName.layoutIfNeeded()
        
        addSubview(lblWeatherState)
        lblWeatherState.topAnchor.constraint(equalTo: lblCityName.topAnchor).isActive = true
        lblWeatherState.trailingAnchor.constraint(equalTo: imgViewBackground.trailingAnchor, constant: -20).isActive = true
        lblWeatherState.bottomAnchor.constraint(equalTo: imgViewBackground.bottomAnchor, constant: -20).isActive = true
        lblWeatherState.layoutIfNeeded()
        
        addSubview(imgMidRain)
        imgMidRain.topAnchor.constraint(equalTo: imgViewBackground.topAnchor, constant: -40).isActive = true
        imgMidRain.trailingAnchor.constraint(equalTo: imgViewBackground.trailingAnchor).isActive = true
        imgMidRain.layoutIfNeeded()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
