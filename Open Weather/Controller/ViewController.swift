//
//  ViewController.swift
//  Open Weather
//
//  Created by Ahmed Zaki on 1/25/19.
//  Copyright © 2019 Ahmed Zaki. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController , CLLocationManagerDelegate ,UITableViewDelegate , UITableViewDataSource
{
    //Outlet
    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var weatherCondition: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var forecastTabel: UITableView!
 
    //Variabel
    var currentWeather = [CurrentWeather]()
    var currentLocation : CLLocation!
    var params : [String : String] = ["appid":Token_key,"cnt":Num_Day]
    // Constant
    let locationManager = CLLocationManager()
    //Function
    override func viewDidLoad()
    {
        super.viewDidLoad()
        callDelegates()
        setupLocation()
    }

    func callDelegates()
    {
        locationManager.delegate = self
        forecastTabel.delegate = self
        forecastTabel.dataSource = self
    }
    
    func setupLocation()
    {
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization() // take user perm
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[locations.count - 1 ]
        if location.horizontalAccuracy > 0
        {
            locationManager.stopUpdatingLocation()
  
            params["lat"] = "\(location.coordinate.latitude)"
            params["lon"] = "\(location.coordinate.longitude)"
            getWeatherData(params: params, complete:
            {
                (data) in
                self.updateView(weather: data[0])
                self.currentWeather = data
                self.forecastTabel.reloadData()
            })
        }

    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print(error)
        cityName.text = " Location Unavailabel"
    }
    func updateView (weather : CurrentWeather)
    {
        cityName.text = weather.cityName
        currentTemp.text = "\(Int(weather.currentTemp!))˚"
        currentDate.text = weather.currentDate
        weatherCondition.text = weather.weatherCondition
        weatherImage.image = UIImage(named: weather.icon)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return currentWeather.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = forecastTabel.dequeueReusableCell(withIdentifier: "ForecastCell") as? ForecastTabelCell
        {
            cell.updateForecastCell(weather: currentWeather[indexPath.row + 1])
            return cell
        }
        else
        {
            return ForecastTabelCell()
        }
        
    }
}





