//
//  City.swift
//  WeatherApp
//
//  Created by Harun Demirkaya on 8.02.2023.
//
// MARK: -Import Libaries
import Foundation

// MARK: -City Model Class
class City{
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}
