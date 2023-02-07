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

// MARK: -ViewController Class
class HomeViewController: UIViewController, UITabBarDelegate, CLLocationManagerDelegate {

    // MARK: -Define
    
    // MARK: Labels Defined
    var lblCityName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "İstanbul"
        label.font = UIFont.fontSFProDisplay(size: 34)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var lblHeat: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "19°"
        label.font = UIFont.fontSFProDisplay(size: 96)
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
        label.text = "H:24°"
        label.font = UIFont.fontSFProDisplay(size: 20)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var lblLowHeat: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "L:18°"
        label.font = UIFont.fontSFProDisplay(size: 20)
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
    var weatherViewModel = WeatherViewModel()
    
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
            setData()
        }
    }
    
    // MARK: -Temperatures Defined
    var temperatures = [Measurement<UnitTemperature>]()
    
    // MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: Screen
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: TabBar Delegate
        detailsTabBar.delegate = self
        
        // MARK: Constraints
        imgBackground.imgBackgroundConstraints(view)
        
        lblCityName.lblCityNameConstraints(view)
        lblHeat.lblHeeatConstraints(view, lblCityName: lblCityName)
        lblMostlyClear.lblMostlyClearConstraints(view, lblHeat: lblHeat)
        lblHighHeat.lblHighHeat(view, lblMostlyClear: lblMostlyClear)
        lblLowHeat.lblLowHeat(view, lblMostlyClear: lblMostlyClear)
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
        contentViewHourly.contentViewConstraints(view: scrollViewHourly, tabBar: detailsTabBar)
        scrollViewSetup(weekOrHour: "Hour", scrollItems: &scrollItemsHourly, contentView: self.contentViewHourly)
        // MARK: Weekly ScrollView
        scrollViewWeekly.scrollViewConstraints(weeklyView, tabBar: detailsTabBar)
        contentViewWeekly.contentViewConstraints(view: scrollViewWeekly, tabBar: detailsTabBar)
        scrollViewSetup(weekOrHour: "Week", scrollItems: &scrollItemsWeekly, contentView: self.contentViewWeekly)
        
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
    }
    
    func setData(){
        let dateFormatteer = DateFormatter()
        dateFormatteer.dateFormat = "yyyy-MM-dd"
        var otherDate = ""
        for forecast in hourlyForecast!{
            otherDate = dateFormatteer.string(from: forecast.date)
            if otherDate.prefix(10) == date{
                temperatures.append(forecast.temperature)
            }
        }
        for i in 0...23{
            DispatchQueue.main.async {
                let label = self.scrollItemsHourly[i].subviews[2] as! UILabel
                label.text = self.temperatures[i].description
            }
        }
    }

    
}

