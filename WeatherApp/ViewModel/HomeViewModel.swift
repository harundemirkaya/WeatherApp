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
class HomeViewModel{
    
    // MARK: -Define
    
    // MARK: ViewController Defined
    var homeVC: HomeViewController?
    
    // MARK: Weather Kit Services Defined
    let service = WeatherService()
    
    // MARK: Hourly Forecast
    var weather: Weather?
    
    // MARK: Weather Kit
    func getWeather(location: CLLocation){
        Task{
            do{
                let result = try await service.weather(for: location)
                weather = result
                setWeather()
            } catch{
                print(String(describing: error))
            }
        }
    }
    
    func setWeather(){
        homeVC?.hourlyForecast = weather?.hourlyForecast
        homeVC?.weeklyForecast = weather?.dailyForecast
        homeVC?.currentWeather = weather
    }
    
    func getUserLocation(locationManager: CLLocationManager, delegate: CLLocationManagerDelegate){
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = delegate
        locationManager.startUpdatingLocation()
    }
}
