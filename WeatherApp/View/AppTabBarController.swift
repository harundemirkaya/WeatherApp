//
//  AppTabBarController.swift
//  WeatherApp
//
//  Created by Harun Demirkaya on 3.02.2023.
//

import UIKit

// MARK: -App Tab Bar Class
class AppTabBarController: UITabBarController {
    
    var views: [UIViewController] = []
    
    // MARK: -ViewDidLoad
    override func viewDidLoad() {
        UITabBar.appearance().tintColor = UIColor.clear
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // MARK: Define VC and Add Tab Bar
        let homeVC = TabBarOneViewController()
        homeVC.tabBarItem = UITabBarItem(title: "Deneme", image: UIImage(named: "bell"), tag: 1)
        
        let whereVC = HomeViewController()
        whereVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "tab-item-background")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), selectedImage: UIImage(named: "tab-item-background")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal))

        let stationsVC = TabBarTwoViewController()
        stationsVC.tabBarItem = UITabBarItem(title: "Deneme", image: UIImage(named: "bell"), tag: 1)
        
        views = [homeVC, whereVC, stationsVC]
        tabBar.selectedItem?.badgeColor = .green
        self.viewControllers = views
        selectedIndex = 1
        tabBar.backgroundColor = .white
        addHeightConstraintToTabbar()
    }
    
    func addHeightConstraintToTabbar() -> Void {
        let heightConstant:CGFloat = self.view.safeAreaInsets.bottom + 49.0
        tabBar.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
    }
}

