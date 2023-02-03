//
//  ViewController.swift
//  WeatherApp
//
//  Created by Harun Demirkaya on 3.02.2023.
//
// MARK: -Import Libaries
import UIKit

// MARK: -ViewController Class
class ViewController: UIViewController {

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
    
    var imgTabBarBackground: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "tab-bar-background"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // MARK: Constraints
        imgBackground.imgBackgroundConstraints(view)
        lblCityName.lblCityNameConstraints(view)
        lblHeat.lblHeeatConstraints(view, lblCityName: lblCityName)
        lblMostlyClear.lblMostlyClearConstraints(view, lblHeat: lblHeat)
        lblHighHeat.lblHighHeat(view, lblMostlyClear: lblMostlyClear)
        lblLowHeat.lblLowHeat(view, lblMostlyClear: lblMostlyClear)
        imgHouse.imgHouseConstraints(view, lblHighorLowHeat: lblHighHeat)
        imgTabBarBackground.imgTabBarBackgroundConstraints(view)
    }
}

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
    
    func imgTabBarBackgroundConstraints(_ view: UIView){
        view.addSubview(self)
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

// MARK: -Custom Font
extension UIFont {
    class func fontSFProDisplay(size: CGFloat) -> UIFont {
        return UIFont.init(name: "SFProDisplay-Regular", size: size)!
     }
}
