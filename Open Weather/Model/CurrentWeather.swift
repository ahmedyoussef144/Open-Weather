//
//  CurrentWeather.swift
//  Open Weather
//
//  Created by Ahmed Zaki on 1/25/19.
//  Copyright © 2019 Ahmed Zaki. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CurrentWeather
{
    private var _cityName : String!
    private var _weatherCondition : String!
    private var _currentTemp : Double!
    private var _currentDate : String!
    private var _icon : String!
    private var ICON_URL = "http://openweathermap.org/img/w/"
    private var _weatherImage : Data!
    var cityName : String
    {
        if _cityName == nil
        {
            _cityName = ""
        }
        return _cityName
    }
    var icon : String
    {
        if _icon  == nil
        {
           _icon = ""
        }
        return _icon
    }
    var weatherImage : Data
    {
        if _weatherImage == nil
        {
            _weatherImage = Data()
        }
        return _weatherImage
    }
    
    var currentDate: String
    {
        if _currentDate == nil
        {
            _currentDate = ""
        }
        return _currentDate
    }
    
    var weatherCondition: String
    {
        if _weatherCondition == nil
        {
            _weatherCondition = ""
        }
        return _weatherCondition
    }
    
    var currentTemp: Double
    {
        if _currentTemp == nil
        {
            _currentTemp = 0.0
        }
        return _currentTemp
    }

    func downloadCurrentWeather (complete : @escaping downloadComplete)
    {
        Alamofire.request(API_URL).responseJSON
        {
                (response) in
                switch response.result
                {
                case .success :
                    let json = JSON(response.result.value)
                    self._cityName = json["name"].stringValue
                    self._weatherCondition = json["weather"][0]["main"].stringValue
                    let downloadedDate = json["dt"].doubleValue
                    self._currentDate = convertDate(timeInterval: downloadedDate)
                    let downloadedTemp = (json["main"]["temp"].doubleValue)
                    self._currentTemp =  floor(downloadedTemp - 272.15)
                    self._icon = json["weather"][0]["icon"].stringValue
                    DispatchQueue.main.async
                    {
                        complete()
                    }
                case .failure(let error):
                    print(error)
                }
        }
        
    }

}


