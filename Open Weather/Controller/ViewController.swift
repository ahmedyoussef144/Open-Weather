//
//  ViewController.swift
//  Open Weather
//
//  Created by Ahmed Zaki on 1/25/19.
//  Copyright © 2019 Ahmed Zaki. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController , CLLocationManagerDelegate
{
    //Outlet
    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var weatherCondition: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var loadingData: UIActivityIndicatorView!
    
    //Variabel
    var currentWeather : CurrentWeather!
    var currenyLocation : CLLocation!
    // Constant
    let locationManager = CLLocationManager()
    //Function
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentWeather  = CurrentWeather()
        loadingData.startAnimating()
        currentWeather.downloadCurrentWeather
        {
            self.updateView()
        }
        loadingData.stopAnimating()
        callDelegates()
    }
    
    func callDelegates()
    {
        locationManager.delegate = self
    }
    func updateView ()
    {
        cityName.text = currentWeather.cityName
        currentTemp.text = "\(Int(currentWeather.currentTemp))˚"
        currentDate.text = currentWeather.currentDate
        weatherCondition.text = currentWeather.weatherCondition
    }

}

