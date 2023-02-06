//
//  Constraints.swift
//  WeatherApp
//
//  Created by Harun Demirkaya on 6.02.2023.
//
// MARK: -Import Libaries
import Foundation
import UIKit

// MARK: -Constraints
public extension UIView{
    func imgBackgroundConstraints(_ view: UIView){
        view.addSubview(self)
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func lblCityNameConstraints(_ view: UIView){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
    }
    
    func lblHeeatConstraints(_ view: UIView, lblCityName: UILabel){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topAnchor.constraint(equalTo: lblCityName.bottomAnchor, constant: 10).isActive = true
    }
    
    func lblMostlyClearConstraints(_ view: UIView, lblHeat: UILabel){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topAnchor.constraint(equalTo: lblHeat.bottomAnchor, constant: 10).isActive = true
    }
    
    func lblHighHeat(_ view: UIView, lblMostlyClear: UILabel){
        view.addSubview(self)
        topAnchor.constraint(equalTo: lblMostlyClear.bottomAnchor, constant: 5).isActive = true
        leadingAnchor.constraint(equalTo: lblMostlyClear.leadingAnchor).isActive = true
    }
    
    func lblLowHeat(_ view: UIView, lblMostlyClear: UILabel){
        view.addSubview(self)
        topAnchor.constraint(equalTo: lblMostlyClear.bottomAnchor, constant: 5).isActive = true
        trailingAnchor.constraint(equalTo: lblMostlyClear.trailingAnchor).isActive = true
    }
    
    func imgHouseConstraints(_ view: UIView, lblHighorLowHeat: UILabel){
        view.addSubview(self)
        topAnchor.constraint(equalTo: lblHighorLowHeat.bottomAnchor, constant: 20).isActive = true
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func stackViewConstraints(_ view: UIView){
        view.addSubview(self)
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func detailsViewConstraints(_ view: UIView, imgView: UIImageView){
        view.addSubview(self)
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: imgView.frame.size.height).isActive = true
    }
    
    func imgDetailsBackgroundConstraints(_ detailsView: UIView){
        detailsView.addSubview(self)
        leadingAnchor.constraint(equalTo: detailsView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: detailsView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: detailsView.bottomAnchor).isActive = true
    }
    
    func tabBarViewConstraints(_ view: UIView){
        view.addSubview(self)
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: view.frame.size.height * 0.1).isActive = true
    }
    
    func btnAddConstraints(tabBarView: UIView){
        tabBarView.addSubview(self)
        centerXAnchor.constraint(equalTo: tabBarView.centerXAnchor).isActive = true
        bottomAnchor.constraint(equalTo: tabBarView.bottomAnchor).isActive = true
    }
    
    func btnLocationConstraints(tabBarView: UIView, btnAdd: UIButton){
        tabBarView.addSubview(self)
        bottomAnchor.constraint(equalTo: tabBarView.bottomAnchor, constant: -20).isActive = true
        trailingAnchor.constraint(equalTo: btnAdd.leadingAnchor, constant: 15).isActive = true
    }
    
    func btnListConstraints(tabBarView: UIView, btnAdd: UIButton){
        tabBarView.addSubview(self)
        bottomAnchor.constraint(equalTo: tabBarView.bottomAnchor, constant: -20).isActive = true
        leadingAnchor.constraint(equalTo: btnAdd.trailingAnchor).isActive = true
    }
    
    func detailsTabBarConstraints(_ view: UIView, img: UIImageView){
        view.addSubview(self)
        leadingAnchor.constraint(equalTo: img.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: img.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: img.topAnchor).isActive = true
    }
    
    func scrollViewConstraints(_ view: UIView, tabBar: UITabBar){
        view.addSubview(self)
        topAnchor.constraint(equalTo: tabBar.bottomAnchor, constant: 15).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: tabBar.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: tabBar.trailingAnchor).isActive = true
    }
    
    func contentViewConstraints(view: UIView, tabBar: UITabBar){
        view.addSubview(self)
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        widthAnchor.constraint(equalToConstant: 1920).isActive = true
        heightAnchor.constraint(equalToConstant: 160).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func lblHourConstraintsScroll(_ view: UIView){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
    }
    
    func imgViewIconConstraintsScroll(_ view: UIView){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func lblHeatConstraintsScroll(_ view: UIView){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
    }
    
    func separatorConstraints(_ view: UIView, tabBar: UITabBar){
        view.addSubview(self)
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topAnchor.constraint(equalTo: tabBar.bottomAnchor).isActive = true
    }
    
    func underLineConstraints(_ view: UIView, tabBar: UITabBar){
        view.addSubview(self)
        trailingAnchor.constraint(equalTo: tabBar.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: tabBar.bottomAnchor).isActive = true
    }
}
