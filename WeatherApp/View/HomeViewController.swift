//
//  ViewController.swift
//  WeatherApp
//
//  Created by Harun Demirkaya on 3.02.2023.
//
// MARK: -Import Libaries
import UIKit
import CoreLocation
import WeatherKit
import MapKit

// MARK: -ViewController Class
class HomeViewController: UIViewController, UITabBarDelegate, CLLocationManagerDelegate {

    // MARK: -Define
    
    // MARK: -Current City
    var currentCity = String()
    
    // MARK: Labels Defined
    var lblCityName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.fontSFProDisplay(size: 34)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var lblHeat: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.fontSFProDisplay(size: 50)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var lblMostlyClear: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mostly Clear"
        label.font = UIFont.fontSFProDisplay(size: 20)
        label.textAlignment = .center
        label.textColor = .white.withAlphaComponent(0.6)
        return label
    }()
    
    var lblHighHeat: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.fontSFProDisplay(size: 20)
        label.text = "H: "
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var lblLowHeat: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.fontSFProDisplay(size: 20)
        label.textAlignment = .center
        label.text = "  L: "
        label.textColor = .white
        return label
    }()
    
    var lblHighLowBrace: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.fontSFProDisplay(size: 15)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    // MARK: -Images Defined
    var imgBackground: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "home-background"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var imgHouse: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "house"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var imgDetailsBackground: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "tab-bar-background"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var imgDetailsBackgroundTwo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "tab-bar-background"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
   // MARK: -Views Defined
    var tabBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var hourlyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var weeklyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // MARK: -Buttons Defined
    var btnAdd: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "add-button-image"), for: UIControl.State.normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var btnLocation: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "location-button-image"), for: UIControl.State.normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var btnList: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "list-button-image"), for: UIControl.State.normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var detailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: -Custom TabBar
    let detailsTabBar: UITabBar = {
        let tabBar = UITabBar()
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.barTintColor = .clear
        tabBar.backgroundColor = .clear
        tabBar.isTranslucent = true
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.tintColor = .white
        return tabBar
    }()
    
    var hourlyItem: UITabBarItem = {
        let item = UITabBarItem(title: "Hourly Forecast", image: nil, selectedImage: nil)
        item.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.fontSFProDisplay(size: 15)], for: .normal)
        item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15, right: 0)
        item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
        return item
    }()
    
    var weeklyItem: UITabBarItem = {
        let item = UITabBarItem(title: "Weekly Forecast", image: nil, selectedImage: nil)
        item.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.fontSFProDisplay(size: 15)], for: .normal)
        item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15, right: 0)
        item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -15)
        return item
    }()
    
    // MARK: -ScrollView Defined
    var scrollViewHourly: UIScrollView = {
        let view = UIScrollView()
        view.contentInset = .zero
        view.contentOffset = .zero
        view.isPagingEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contentViewHourly: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var scrollItemsHourly: [UIView] = []
    
    let scrollViewWeekly: UIScrollView = {
        let view = UIScrollView()
        view.contentInset = .zero
        view.contentOffset = .zero
        view.isPagingEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contentViewWeekly: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var scrollItemsWeekly: [UIView] = []
    
    // MARK: -TabBar Underline Defined
    var underLine: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "underline"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var separator: UIImageView = {
        let imgView = UIImageView(image: UIImage(named: "separator"))
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var underLineTemp = 0
    
    // MARK: -Location Manager Defined
    let locationManager = CLLocationManager()
    
    // MARK: -WeatherViewModel Defined
    var weatherViewModel = HomeViewModel()
    
    // MARK: -Date Defined
    var date: String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        let dateString = format.string(from: date)
        return dateString
    }
    
    // MARK: -HourlyForecast Array Defined
    var hourlyForecast: Forecast<HourWeather>? {
        didSet{
            setDataHourly()
        }
    }
    
    // MARK: -Temperatures Defined
    var temperaturesHourly = [Measurement<UnitTemperature>]()
    var temperaturesWeekly = [Measurement<UnitTemperature>]()
    
    // MARK: -WeeklyForecast Array Defined
    var weeklyForecast: Forecast<DayWeather>? {
        didSet{
            setDataWeekly()
        }
    }
    
    // MARK: -All User Location Weather Data
    var currentWeather: Weather?
    
    // MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: Screen
        view.backgroundColor = .white
        
        // MARK: TabBar Delegate
        detailsTabBar.delegate = self
        
        // MARK: Constraints
        imgBackground.imgBackgroundConstraints(view)
        
        lblCityName.lblCityNameConstraints(view)
        lblHeat.lblHeeatConstraints(view, lblCityName: lblCityName)
        lblMostlyClear.lblMostlyClearConstraints(view, lblHeat: lblHeat)
        lblHighLowBrace.lblHighLowBraceConstraints(view, lblMostlyClear: lblMostlyClear)
        lblHighHeat.lblHighHeat(view, lblMostlyClear: lblMostlyClear, lblBrace: lblHighLowBrace)
        lblLowHeat.lblLowHeat(view, lblMostlyClear: lblMostlyClear, lblBrace: lblHighLowBrace)
        imgHouse.imgHouseConstraints(view, lblHighorLowHeat: lblHighHeat)
        detailStackView.stackViewConstraints(view)
        
        // MARK: StackView Added (HourlyView, WeeklyView and TabBarView)
        detailStackView.addArrangedSubview(hourlyView)
        hourlyView.detailsViewConstraints(view, imgView: imgDetailsBackground)
        imgDetailsBackground.imgDetailsBackgroundConstraints(hourlyView)
        detailStackView.addArrangedSubview(weeklyView)
        weeklyView.detailsViewConstraints(view, imgView: imgDetailsBackgroundTwo)
        imgDetailsBackgroundTwo.imgDetailsBackgroundConstraints(weeklyView)
        detailStackView.addArrangedSubview(tabBarView)
        tabBarView.tabBarViewConstraints(view)
        
        // MARK: TabBar Buttons
        btnAdd.btnAddConstraints(tabBarView: tabBarView)
        btnLocation.btnLocationConstraints(tabBarView: tabBarView, btnAdd: btnAdd)
        btnList.btnListConstraints(tabBarView: tabBarView, btnAdd: btnAdd)
        
        // MARK: Button Target
        btnAdd.addTarget(self, action: #selector(addCityTarget), for: UIControl.Event.touchUpInside)
        
        // MARK: TabBar Config
        detailsTabBar.items = [hourlyItem, weeklyItem]
        detailsTabBar.selectedItem = hourlyItem
        detailsTabBar.detailsTabBarConstraints(view, img: imgDetailsBackground)
        separator.separatorConstraints(view, tabBar: detailsTabBar)
        underLine.underLineConstraints(view, tabBar: detailsTabBar)
        
        // MARK: TabBar View
        hourlyView.isHidden = false
        weeklyView.isHidden = true
        
        // MARK: Hourly ScrollView
        scrollViewHourly.scrollViewConstraints(hourlyView, tabBar: detailsTabBar)
        contentViewHourly.contentViewConstraints(view: scrollViewHourly, tabBar: detailsTabBar, count: 1920)
        scrollViewSetupHourly(scrollItems: &scrollItemsHourly, contentView: self.contentViewHourly)
        // MARK: Weekly ScrollView
        scrollViewWeekly.scrollViewConstraints(weeklyView, tabBar: detailsTabBar)
        contentViewWeekly.contentViewConstraints(view: scrollViewWeekly, tabBar: detailsTabBar, count: 720)
        scrollViewSetupWeekly(scrollItems: &scrollItemsWeekly, contentView: self.contentViewWeekly)
        
        weatherViewModel.homeVC = self
        weatherViewModel.getUserLocation(locationManager: locationManager, delegate: self)
    }
    
    @objc func addCityTarget(){
        let addCityVC = AddCityViewController()
        addCityVC.modalPresentationStyle = .fullScreen
        present(addCityVC, animated: true)
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.title{
        case "Hourly Forecast":
            hourlyView.isHidden = false
            weeklyView.isHidden = true
            if underLineTemp == 1{
                underLine.transform = underLine.transform.rotated(by: .pi)
                underLineTemp = 0
            }
        case "Weekly Forecast":
            hourlyView.isHidden = true
            weeklyView.isHidden = false
            if underLineTemp == 0{
                underLine.transform = underLine.transform.rotated(by: .pi)
                underLineTemp = 1
            }
        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else{
            return
        }
        locationManager.stopUpdatingLocation()
        weatherViewModel.getWeather(location: location)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let firstPlacemark = placemarks?.first {
                self.currentCity = firstPlacemark.locality ?? "*"
            }
            self.lblCityName.text = UserDefaults.standard.string(forKey: "city") ?? self.currentCity
        }
    }
    
    func setDataHourly(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var otherDate = ""
        var hours: [String] = []
        for forecast in hourlyForecast!{
            otherDate = dateFormatter.string(from: forecast.date)
            if otherDate.prefix(10) == date{
                temperaturesHourly.append(forecast.temperature)
                let dateFormatterHour = DateFormatter()
                dateFormatterHour.dateFormat = "HH:mm"
                hours.append(dateFormatterHour.string(from: forecast.date))
            }
        }
        for i in 0...23{
            DispatchQueue.main.async {
                let lblTemperature = self.scrollItemsHourly[i].subviews[2] as! UILabel
                lblTemperature.text = self.temperaturesHourly[i].description
                let lblHour = self.scrollItemsHourly[i].subviews[0] as! UILabel
                lblHour.text = hours[i]
            }
        }
    }
    
    func setDataWeekly(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var otherDate = ""
        var day: [String] = []
        for forecast in weeklyForecast!{
            otherDate = dateFormatter.string(from: forecast.date)
            if otherDate.prefix(10) > date{
                temperaturesWeekly.append(forecast.highTemperature)
                let dateFormatterDay = DateFormatter()
                dateFormatterDay.dateFormat = "EEEE"
                day.append(dateFormatterDay.string(from: forecast.date))
            }
        }
        for i in 0...8{
            DispatchQueue.main.async {
                let lblTemperature = self.scrollItemsWeekly[i].subviews[2] as! UILabel
                lblTemperature.text = self.temperaturesWeekly[i].description
                let lblDay = self.scrollItemsWeekly[i].subviews[0] as! UILabel
                lblDay.text = day[i]
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            switch status {
            case .denied:
               print("error")
            case .authorizedAlways:
                weatherViewModel.getWeather(location: manager.location!)
            case .authorizedWhenInUse:
                weatherViewModel.getWeather(location: manager.location!)
            default:
                break
            }
        }
}

