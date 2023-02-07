//
//  AddCityViewController.swift
//  WeatherApp
//
//  Created by Harun Demirkaya on 6.02.2023.
//
// MARK: -Import Libaries
import UIKit

// MARK: -AddCityViewController Class
class AddCityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

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
    
    
    // MARK: -SearchBar Defined
    let searchBar: UISearchBar = {
        let bar = UISearchBar()
        let placeHolderColor = UIColor(red: 0.92, green: 0.92, blue: 0.96, alpha: 0.60)
        bar.sizeToFit()
        bar.searchBarStyle = .minimal
        bar.layer.cornerRadius = 10
        bar.searchTextField.font = UIFont.fontSFProDisplay(size: 17)
        bar.searchTextField.textColor = .white
        bar.searchTextField.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.20, alpha: 1.00)
        bar.searchTextField.attributedPlaceholder = NSAttributedString.init(string: "Search for a city or airport", attributes: [NSAttributedString.Key.foregroundColor:placeHolderColor])
        let imgViewSearchIcon = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        imgViewSearchIcon.tintColor = placeHolderColor
        bar.searchTextField.leftView = imgViewSearchIcon
        bar.inputAccessoryView?.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    var btnCloseKeyboard: UIButton = {
        let btn = UIButton()
        btn.setTitle("Close Keyboard", for: UIControl.State.normal)
        btn.setTitleColor(.black, for: UIControl.State.normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        return btn
    }()
    
    var weathers: [String] = [
        "19°",
        "19°",
        "19°",
        "19°",
    ]
    
    // MARK: -Cell Height Set Tools Defined
    var imgView = UIView()
    
    // MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        btnCloseKeyboard.addTarget(self, action: #selector(closeKeyboard), for: .touchUpInside)
        // MARK: Constraints and AddSubView
        imgBackground.imgBackgroundConstraints(view)
        lblTitle.addCityLblTitleConstraints(view)
        tableView.weatherTableViewConstraints(view, title: lblTitle)
        btnBack.btnBackConstraints(view, lbl: lblTitle)
        
        // MARK: Back Button Target
        btnBack.addTarget(self, action: #selector(btnBackTarget), for: UIControl.Event.touchUpInside)
        
        // MARK: Search Bar Config
        searchBar.delegate = self
        tableView.tableHeaderView = searchBar
        searchBar.inputAccessoryView = btnCloseKeyboard
    }
    
    @objc func closeKeyboard(){
        searchBar.endEditing(true)
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
