//
//  ViewController.swift
//  WeatherApp
//
//  Created by Harun Demirkaya on 3.02.2023.
//
// MARK: -Import Libaries
import UIKit

// MARK: -ViewController Class
class HomeViewController: UIViewController, UITabBarDelegate {

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
    let scrollViewHourly: UIScrollView = {
        let v = UIScrollView()
        v.contentInset = .zero
        v.contentOffset = .zero
        v.isPagingEnabled = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let contentViewHourly: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var scrollItemsHourly: [UIView] = []
    
    let scrollViewWeekly: UIScrollView = {
        let v = UIScrollView()
        v.contentInset = .zero
        v.contentOffset = .zero
        v.isPagingEnabled = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let contentViewWeekly: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    var scrollItemsWeekly: [UIView] = []
    
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
        
        // MARK: TabBar Config
        detailsTabBar.items = [hourlyItem, weeklyItem]
        detailsTabBar.selectedItem = hourlyItem
        detailsTabBar.detailsTabBarConstraints(view, img: imgDetailsBackground)
        
        // MARK: TabBar View
        hourlyView.isHidden = false
        weeklyView.isHidden = true
        
        // MARK: Hourly ScrollView
        scrollViewHourly.scrollViewConstraints(hourlyView, tabBar: detailsTabBar)
        contentViewHourly.contentViewConstraints(view: scrollViewHourly, tabBar: detailsTabBar)
        scrollViewSetup(weekOrHour: "Hour", scrollItems: scrollItemsHourly, contentView: contentViewHourly)
        // MARK: Weekly ScrollView
        scrollViewWeekly.scrollViewConstraints(weeklyView, tabBar: detailsTabBar)
        contentViewWeekly.contentViewConstraints(view: scrollViewWeekly, tabBar: detailsTabBar)
        scrollViewSetup(weekOrHour: "Week", scrollItems: scrollItemsWeekly, contentView: contentViewWeekly)
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.title{
        case "Hourly Forecast":
            hourlyView.isHidden = false
            weeklyView.isHidden = true
        case "Weekly Forecast":
            hourlyView.isHidden = true
            weeklyView.isHidden = false
        default:
            break
        }
    }
}

