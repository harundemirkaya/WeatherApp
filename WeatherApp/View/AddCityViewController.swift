//
//  AddCityViewController.swift
//  WeatherApp
//
//  Created by Harun Demirkaya on 6.02.2023.
//
// MARK: -Import Libaries
import UIKit

// MARK: -AddCityViewController Class
class AddCityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: -Define
    
    // MARK: Background Defined
    var imgBackground: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "add-city-background"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: Label Defined
    var lblTitle: UILabel = {
        var lbl = UILabel()
        lbl.text = "Weather"
        lbl.font = UIFont.fontSFProDisplay(size: 28)
        lbl.textColor = .white
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    // MARK: TableView Defined
    private lazy var tableView : UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
        table.register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.allowsSelection = false
        return table
    }()
    
    // MARK: -Back Button Defined
    var btnBack: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "chevron.backward"), for: UIControl.State.normal)
        btn.tintColor = .white
        return btn
    }()
    
    var weathers: [String] = [
        "19°",
        "19°",
        "19°",
        "19°",
    ]
    
    // MARK: -Cell Height Set Tools
    var imgView = UIView()
    
    // MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        // MARK: Constraints and AddSubView
        imgBackground.imgBackgroundConstraints(view)
        lblTitle.addCityLblTitleConstraints(view)
        tableView.weatherTableViewConstraints(view, title: lblTitle)
        btnBack.btnBackConstraints(view, lbl: lblTitle)
        
        // MARK: Back Button Target
        btnBack.addTarget(self, action: #selector(btnBackTarget), for: UIControl.Event.touchUpInside)
    }
    
    @objc func btnBackTarget(){
        let homeVC = HomeViewController()
        homeVC.modalPresentationStyle = .fullScreen
        present(homeVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as! WeatherTableViewCell
        cell.contentView.backgroundColor = UIColor.clear
        cell.textLabel?.text = weathers[indexPath.row]
        cell.textLabel?.textColor = .white
        imgView = (cell.backgroundView)!
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return imgView.frame.size.height + 50
    }
}
