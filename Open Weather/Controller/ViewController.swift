//
//  ViewController.swift
//  Open Weather
//
//  Created by Ahmed Zaki on 1/25/19.
//  Copyright © 2019 Ahmed Zaki. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class ViewController: UIViewController , CLLocationManagerDelegate
{
    //Outlet
    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var weatherCondition: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var forcastTable: UITableView!
    
    //Variabel
    var currentWeather : CurrentWeather!
    var currentLocation : CLLocation!
    var forecast : [Forecast]!
    // Constant
    let locationManager = CLLocationManager()
    //Function
    override func viewDidLoad()
    {
        super.viewDidLoad()
        currentWeather  = CurrentWeather()
        forecast = [Forecast]()
        callDelegates()
        setupLocation()
        
    }
    override func viewDidAppear(_ animated: Bool)
    {
        locationAuthCheck()
    }
    func locationAuthCheck()
    {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse
        { // user allow
         // get location form device
            currentLocation = locationManager.location
         // pass location to api
            Location.sharedInstance.latitude =  currentLocation.coordinate.latitude
            Location.sharedInstance.longitude =  currentLocation.coordinate.longitude
            print (Location.sharedInstance.latitude
            )
        // download data and update ui
            currentWeather.downloadCurrentWeather
            {
                self.updateView()
            }
            downloadForecast()
        }
        else
        { // user not allow
          locationAuthCheck()
        }
    }
    
    func setupLocation()
    {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization() // take user perm
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    func callDelegates()
    {
        locationManager.delegate = self
        forcastTable.delegate = self
        forcastTable.dataSource = self
    }
    
    func updateView ()
    {
        cityName.text = currentWeather.cityName
        currentTemp.text = "\(Int(currentWeather.currentTemp))˚"
        currentDate.text = currentWeather.currentDate
        weatherCondition.text = currentWeather.weatherCondition
        //weatherImage.image = UIImage(data: currentWeather.weatherImage)
    }
    
    func downloadForecast ()
    {
        Alamofire.request(FORECAST_API_URL).responseJSON
            {
                (response) in
                switch response.result
                {
                case .success :
                    let json = JSON(response.result.value)
                    for index in 1...15
                    {
                        let date = json["list"][index]["dt"].doubleValue
                        var dayOfTheWeek = Date(timeIntervalSince1970: date).dayOfTheWeek()
                        let temp = floor(json["list"][index]["temp"]["day"].doubleValue - 273.15)
                        self.forecast.append(Forecast(forecastDate: dayOfTheWeek , forecastTemp: temp))
                    }
                    self.forcastTable.reloadData()
                case .failure(let error):
                    print(error)
                }
        }
    }
}
extension ViewController : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return forecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = forcastTable.dequeueReusableCell(withIdentifier: "ForecastCell") as? ForecastCell
        {
            
            cell.updataForecastCell(forecast: (forecast[indexPath.row]))
            return cell
        }
        else
        {
            return ForecastCell()
        }
    }
    
}


