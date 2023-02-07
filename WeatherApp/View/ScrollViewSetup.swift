//
//  ScrollViewSetup.swift
//  WeatherApp
//
//  Created by Harun Demirkaya on 6.02.2023.
//
// MARK: -Import Libaries
import Foundation
import UIKit

// MARK: ScrollView Items Hourly Setup
func scrollViewSetup(weekOrHour: String, scrollItems: [UIView], contentView: UIView, temperatures: [Measurement<UnitTemperature>]? = nil){
    
    var scrollItems = scrollItems
    let weeks = ["Mon", "Tues", "Wednes", "Thurs", "Fri", "Satur", "Sun"]
    var week = 0
    for i in 1...24{
        if week == 6{
            week = 0
        }
        let scrollItem: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor(red: 0.28, green: 0.19, blue: 0.62, alpha: 0.3)
            view.layer.cornerRadius = 30
            view.layer.borderWidth = 0.1
            view.layer.borderColor = UIColor.white.cgColor
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
        let lblHour: UILabel = {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.textColor = .white
            lbl.font = UIFont.fontSFProDisplay(size: 15)
            if weekOrHour == "Hour"{
                lbl.text = "\(i) PM"
            } else{
                lbl.text = weeks[week]
                week += 1
            }
            return lbl
        }()
        lblHour.lblHourConstraintsScroll(scrollItem)
        
        let imgViewIcon: UIImageView = {
            let imgView = UIImageView(image: UIImage(named: "rain-icon"))
            imgView.translatesAutoresizingMaskIntoConstraints = false
            return imgView
        }()
        imgViewIcon.imgViewIconConstraintsScroll(scrollItem)
        
        let lblHeat: UILabel = {
            let lbl = UILabel()
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.textColor = .white
            lbl.font = UIFont.fontSFProDisplay(size: 20)
            if temperatures == nil{
                lbl.text = "*"
            } else{
                lbl.text = temperatures?[i-1].description
            }
            
            return lbl
        }()
        lblHeat.lblHeatConstraintsScroll(scrollItem)
        
        scrollItems.append(scrollItem)
        contentView.addSubview(scrollItems.last!)
        scrollItems.last?.translatesAutoresizingMaskIntoConstraints = false
    }
    
    for i in 0...23{
        if i == 0{
            scrollItems[i].leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        } else{
            scrollItems[i].leadingAnchor.constraint(equalTo:  scrollItems[i-1].trailingAnchor , constant: 10).isActive = true
        }
        scrollItems[i].topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollItems[i].widthAnchor.constraint(equalToConstant: 70).isActive = true
        scrollItems[i].heightAnchor.constraint(equalToConstant: 160).isActive = true
    }

}
