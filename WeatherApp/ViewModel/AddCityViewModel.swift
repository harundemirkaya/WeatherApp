//
//  AddCityViewModel.swift
//  WeatherApp
//
//  Created by Harun Demirkaya on 8.02.2023.
//
// MARK: -Import Libaries
import Foundation
import CoreLocation
import WeatherKit

// MARK: -AddCityViewModel Class
class AddCityViewModel{
    
    // MARK: -Define
    
    // MARK: AddCityVC Defined
    var addCityVC: AddCityViewController?
    
    // MARK: -City Temperatures Defined
    var cityTemperatures = [Measurement<UnitTemperature>]()
    var cityHighTemperatures = [Measurement<UnitTemperature>]()
    var cityLowTemperatures = [Measurement<UnitTemperature>]()
    
    // MARK: -City Weather State Defined
    var cityState = [WeatherCondition]()
    
    // MARK: -CityCell Model Defined
    var cityCell = [CityCell]()
    
    // MARK: -Cities
    let cities = [
                      City(name: "Adana", latitude: 37.00167, longitude: 35.32889),
                      City(name: "Adıyaman", latitude: 37.76667, longitude: 38.27389),
                      City(name: "Afyonkarahisar", latitude: 38.75000, longitude: 30.54389),
                      City(name: "Ağrı", latitude: 39.72000, longitude: 43.05000),
                      City(name: "Amasya", latitude: 40.65000, longitude: 35.83000),
                      City(name: "Ankara", latitude: 39.92722, longitude: 32.86444),
                      City(name: "Antalya", latitude: 36.90000, longitude: 30.70000),
                      City(name: "Artvin", latitude: 41.18222, longitude: 41.82306),
                      City(name: "Aydın", latitude: 37.84556, longitude: 27.84611),
                      City(name: "Balıkesir", latitude: 39.64917, longitude: 27.88722),
                      City(name: "Bilecik", latitude: 40.15000, longitude: 29.98333),
                      City(name: "Bingöl", latitude: 38.88389, longitude: 40.49833),
                      City(name: "Bitlis", latitude: 38.39528, longitude: 42.11361),
                      City(name: "Bolu", latitude: 40.73278, longitude: 31.61056),
                      City(name: "Burdur", latitude: 37.71667, longitude: 30.28333),
                      City(name: "Bursa", latitude: 40.19361, longitude: 29.06111),
                      City(name: "Çanakkale", latitude: 40.15417, longitude: 26.40639),
                      City(name: "Çankırı", latitude: 40.60528, longitude: 33.62056),
                      City(name: "Çorum", latitude: 40.54861, longitude: 34.95222),
                      City(name: "Denizli", latitude: 37.77361, longitude: 29.08778),
                      City(name: "Diyarbakır", latitude: 37.91500, longitude: 40.23056),
                      City(name: "Edirne", latitude: 41.67361, longitude: 26.56417),
                      City(name: "Elazığ", latitude: 38.67889, longitude: 39.22083),
                      City(name: "Erzincan", latitude: 39.75000, longitude: 39.49444),
                      City(name: "Erzurum", latitude: 39.90611, longitude: 41.27778),
                      City(name: "Eskişehir", latitude: 39.77361, longitude: 30.52056),
                      City(name: "Gaziantep", latitude: 37.06389, longitude: 37.38528),
                      City(name: "Giresun", latitude: 40.91667, longitude: 38.39528),
                      City(name: "Gümüşhane", latitude: 40.46500, longitude: 39.48167),
                      City(name: "Hakkari", latitude: 37.57389, longitude: 43.73889),
                      City(name: "Hatay", latitude: 36.23056, longitude: 36.12389),
                      City(name: "Isparta", latitude: 37.76361, longitude: 30.53278),
                      City(name: "Mersin", latitude: 36.80056, longitude: 34.61417),
                      City(name: "İstanbul", latitude: 41.10528, longitude: 29.01139),
                      City(name: "İzmir", latitude: 38.42667, longitude: 27.15000),
                      City(name: "Kars", latitude: 40.60972, longitude: 43.09361),
                      City(name: "Kastamonu", latitude: 41.38833, longitude: 33.78389),
                      City(name: "Kayseri", latitude: 38.73222, longitude: 35.48528),
                      City(name: "Kırklareli", latitude: 41.73333, longitude: 27.21667),
                      City(name: "Kırşehir", latitude: 39.14389, longitude: 34.16528),
                      City(name: "Kocaeli", latitude: 40.86583, longitude: 29.88306),
                      City(name: "Konya", latitude: 37.87556, longitude: 32.47583),
                      City(name: "Kütahya", latitude: 39.42333, longitude: 29.98389),
                      City(name: "Malatya", latitude: 38.35000, longitude: 38.30000),
                      City(name: "Manisa", latitude: 38.62361, longitude: 27.43917),
                      City(name: "Kahramanmaraş", latitude: 37.58389, longitude: 36.92611),
                      City(name: "Mardin", latitude: 37.31306, longitude: 40.72639),
                      City(name: "Muğla", latitude: 37.21556, longitude: 28.36389),
                      City(name: "Muş", latitude: 38.74444, longitude: 41.50417),
                      City(name: "Nevşehir", latitude: 38.62556, longitude: 34.71694),
                      City(name: "Niğde", latitude: 37.96667, longitude: 34.68333),
                      City(name: "Ordu", latitude: 40.98333, longitude: 37.88333),
                      City(name: "Rize", latitude: 41.02083, longitude: 40.52194),
                      City(name: "Sakarya", latitude: 40.78056, longitude: 30.40278),
                      City(name: "Samsun", latitude: 41.28667, longitude: 36.33222),
                      City(name: "Siirt", latitude: 37.92500, longitude: 41.93306),
                      City(name: "Sinop", latitude:41.02611, longitude: 35.15389),
                      City(name: "Sivas", latitude: 39.74722, longitude: 37.01861),
                      City(name: "Tekirdağ", latitude: 40.98556, longitude: 27.51194),
                      City(name: "Tokat", latitude: 40.31667, longitude: 36.55000),
                      City(name: "Trabzon", latitude: 41.00528, longitude: 39.71667),
                      City(name: "Tunceli", latitude: 39.11917, longitude: 39.52722),
                      City(name: "Şanlıurfa", latitude: 37.16667, longitude: 38.79306),
                      City(name: "Uşak", latitude: 38.68389, longitude: 29.40278),
                      City(name: "Van", latitude: 38.48944, longitude: 43.38361),
                      City(name: "Yozgat", latitude: 39.82056, longitude: 34.80528),
                      City(name: "Zonguldak", latitude: 41.45056, longitude: 31.78389),
                      City(name: "Aksaray", latitude: 38.36944, longitude: 34.03167),
                      City(name: "Bayburt", latitude: 40.25278, longitude: 40.22778),
                      City(name: "Karaman", latitude: 37.18194, longitude: 33.21528),
                      City(name: "Kırıkkale", latitude: 39.85056, longitude: 33.51667),
                      City(name: "Batman", latitude: 37.88667, longitude: 41.12389),
                      City(name: "Şırnak", latitude: 37.51667, longitude: 42.45083),
                      City(name: "Bartın", latitude: 41.63833, longitude: 32.33833),
                      City(name: "Ardahan", latitude: 41.11667, longitude: 42.70278),
                      City(name: "Iğdır", latitude: 39.91944, longitude: 44.04278),
                      City(name: "Yalova", latitude: 40.65278, longitude: 29.27222),
                      City(name: "Karabük", latitude: 41.20278, longitude: 32.63333),
                      City(name: "Kilis", latitude: 36.72083, longitude: 37.11472),
                      City(name: "Osmaniye", latitude: 37.07222, longitude: 36.24444),
                      City(name: "Düzce", latitude: 40.84167, longitude: 31.16389)
    ]
    
    // MARK: Weather Kit Services Defined
    let service = WeatherService()
    
    // MARK: Weather Kit
    func getWeather() async -> [CityCell]{
        if !cities.isEmpty{
            for i in 0...20{
                let location = CLLocation(latitude: cities[i].latitude, longitude: cities[i].longitude)
                do{
                    let result = try await service.weather(for: location)
                    let city = CityCell(cityName: cities[i].name, temperatures: result.currentWeather.temperature, highTemperatures: result.dailyForecast[0].highTemperature, lowTemperatures: result.dailyForecast[0].lowTemperature, weatherState: result.currentWeather.condition.description)
                    cityCell.append(city)
                } catch{
                    print("")
                }
                
            }
            //addCityVC?.cityCell = cityCell
            return cityCell
        }
        return []
    }
    
    func getWeather2() async -> [CityCell]{
        if !cities.isEmpty{
            for i in 21...40{
                let location = CLLocation(latitude: cities[i].latitude, longitude: cities[i].longitude)
                do{
                    let result = try await service.weather(for: location)
                    let city = CityCell(cityName: cities[i].name, temperatures: result.currentWeather.temperature, highTemperatures: result.dailyForecast[0].highTemperature, lowTemperatures: result.dailyForecast[0].lowTemperature, weatherState: result.currentWeather.condition.description)
                    cityCell.append(city)
                } catch{
                    print("")
                }
                
            }
            //addCityVC?.cityCell = cityCell
            return cityCell
        }
        return []
    }
    
    func getWeather3() async -> [CityCell]{
        if !cities.isEmpty{
            for i in 41...60{
                let location = CLLocation(latitude: cities[i].latitude, longitude: cities[i].longitude)
                do{
                    let result = try await service.weather(for: location)
                    let city = CityCell(cityName: cities[i].name, temperatures: result.currentWeather.temperature, highTemperatures: result.dailyForecast[0].highTemperature, lowTemperatures: result.dailyForecast[0].lowTemperature, weatherState: result.currentWeather.condition.description)
                    cityCell.append(city)
                } catch{
                    print("")
                }
                
            }
            //addCityVC?.cityCell = cityCell
            return cityCell
        }
        return []
    }
    
    func getWeather4() async -> [CityCell]{
        if !cities.isEmpty{
            for i in 61...80{
                let location = CLLocation(latitude: cities[i].latitude, longitude: cities[i].longitude)
                do{
                    let result = try await service.weather(for: location)
                    let city = CityCell(cityName: cities[i].name, temperatures: result.currentWeather.temperature, highTemperatures: result.dailyForecast[0].highTemperature, lowTemperatures: result.dailyForecast[0].lowTemperature, weatherState: result.currentWeather.condition.description)
                    cityCell.append(city)
                } catch{
                    print("")
                }
                
            }
            //addCityVC?.cityCell = cityCell
            return cityCell
        }
        return []
    }
}
