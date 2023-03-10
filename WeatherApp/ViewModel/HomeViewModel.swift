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
    
    // MARK: -Label Text Counter
    var counter = 0
    
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
        DispatchQueue.main.async {
            self.counter += 1
            if self.counter == 2{
                self.homeVC?.lblHeat.text = self.weather?.currentWeather.temperature.description
                self.homeVC?.lblHighHeat.text = (self.homeVC?.lblHighHeat.text)! + (self.weather?.dailyForecast[0].highTemperature.description)!
                self.homeVC?.lblLowHeat.text = (self.homeVC?.lblLowHeat.text)! + (self.weather?.dailyForecast[0].lowTemperature.description)!
            }
        }
    }
    
    func getUserLocation(locationManager: CLLocationManager, delegate: CLLocationManagerDelegate){
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = delegate
        locationManager.startUpdatingLocation()
    }
}
