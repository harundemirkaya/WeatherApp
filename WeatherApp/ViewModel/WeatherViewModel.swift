//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Harun Demirkaya on 7.02.2023.
//
// MARK: -Import Libaries
import Foundation
import CoreLocation
import WeatherKit

// MARK: -WeatherViewModel Class
class WeatherViewModel{
    
    // MARK: -Define
    
    // MARK: ViewController Defined
    var homeVC: HomeViewController?
    
    // MARK: Weather Kit Services Defined
    let service = WeatherService()
    
    // MARK: Weather Kit
    func getWeather(location: CLLocation){
        Task{
            do{
                let result = try await service.weather(for: location)
                print(String(describing: result.hourlyForecast.forecast))
                
            } catch{
                print(String(describing: error))
            }
        }
    }
    
    func getUserLocation(locationManager: CLLocationManager, delegate: CLLocationManagerDelegate){
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = delegate
        locationManager.startUpdatingLocation()
    }
}
