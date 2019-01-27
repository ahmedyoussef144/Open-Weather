//
//  ViewController.swift
//  Open Weather
//
//  Created by Ahmed Zaki on 1/25/19.
//  Copyright © 2019 Ahmed Zaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController
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

    //Function
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentWeather  = CurrentWeather()
        
        loadingData.startAnimating()
        currentWeather.downloadCurrentWeather
        {
            self.updateView()
        }
        loadingData.stopAnimating()
    }
    
    func updateView ()
    {
        cityName.text = currentWeather.cityName
        currentTemp.text = "\(Int(currentWeather.currentTemp))˚"
        currentDate.text = currentWeather.currentDate
        weatherCondition.text = currentWeather.weatherCondition
    }

}

