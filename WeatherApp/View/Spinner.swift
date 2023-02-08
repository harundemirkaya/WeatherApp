//
//  Spinner.swift
//  WeatherApp
//
//  Created by Harun Demirkaya on 8.02.2023.
//

import Foundation
import UIKit

class Spinner{
    
    // MARK: Loading Screen Tools
    let loadingView: UIView = UIView()
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    // MARK: -Loading Screen Start
    func startIndicator(view: UIView){
        loadingView.frame = CGRectMake(0, 0, 118, 50)
        loadingView.center = view.center
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10

        self.activityIndicator = UIActivityIndicatorView()
        self.activityIndicator.frame = CGRectMake(40, 12, 40, 40)
        self.activityIndicator.style = UIActivityIndicatorView.Style.large
        self.activityIndicator.color = .white
        
        loadingView.addSubview(activityIndicator)
        view.addSubview(loadingView)
        self.activityIndicator.startAnimating()
    }

    // MARK: -Loading Screen Stop
    func stopIndicator(view: UIView){
        view.isUserInteractionEnabled = true
        view.window?.isUserInteractionEnabled = true
        activityIndicator.stopAnimating()
        loadingView.removeFromSuperview()
    }

}
