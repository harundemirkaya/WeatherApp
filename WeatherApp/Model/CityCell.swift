//
//  CityCell.swift
//  WeatherApp
//
//  Created by Harun Demirkaya on 8.02.2023.
//
// MARK: -Import Libaries
import Foundation

// MARK: -CityCell Model Class
class CityCell{
    var cityName = String()
    var temperatures: Measurement<UnitTemperature>
    var highTemperatures: Measurement<UnitTemperature>
    var lowTemperatures: Measurement<UnitTemperature>
    var weatherState = String()
    
    init(cityName: String, temperatures: Measurement<UnitTemperature>, highTemperatures: Measurement<UnitTemperature>, lowTemperatures: Measurement<UnitTemperature>, weatherState: String) {
        self.cityName = cityName
        self.temperatures = temperatures
        self.highTemperatures = highTemperatures
        self.lowTemperatures = lowTemperatures
        self.weatherState = weatherState
    }
}
