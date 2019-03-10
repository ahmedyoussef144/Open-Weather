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
     var cityName : String!
     var weatherCondition : String!
     var currentTemp : Double!
     var currentDate : String!
     var icon : String!
}

func getWeatherData(params : [String : String], complete : @escaping downloadComplete)
{
    var data = [CurrentWeather]()
    Alamofire.request(API_URL, method: .get, parameters: params).responseJSON
    {
            (response) in
            switch response.result
            {
            case .success :
                let json = JSON(response.result.value)
                for index in 0...15
                {
                    let currentWeather = CurrentWeather()
                    currentWeather.cityName = json["city"]["name"].stringValue
                    currentWeather.weatherCondition = json["list"][index]["weather"][0]["main"].stringValue
                    let downloadedDate = json["list"][index]["dt"].doubleValue
                    currentWeather.currentDate = Date(timeIntervalSince1970: downloadedDate).dayOfTheWeek()
                    let downloadedTemp = (json["list"][index]["temp"]["day"].doubleValue)
                    currentWeather.currentTemp = floor(downloadedTemp - 272.15)
                    currentWeather.icon = updateWeatherIcon(condition : json["list"][index]["weather"][0]["id"].intValue)
                    data.append(currentWeather)
                }
                DispatchQueue.main.async
                {
                    complete(data)
                }
            case .failure(let error):
                print(error)
            }
    }
    func updateWeatherIcon(condition: Int) -> String
    {
        
        switch (condition) {
            
        case 0...300 :
            return "tstorm1"
            
        case 301...500 :
            return "light_rain"
            
        case 501...600 :
            return "shower3"
            
        case 601...700 :
            return "snow4"
            
        case 701...771 :
            return "fog"
            
        case 772...799 :
            return "tstorm3"
            
        case 800 :
            return "sunny"
            
        case 801...804 :
            return "cloudy2"
            
        case 900...903, 905...1000  :
            return "tstorm3"
            
        case 903 :
            return "snow5"
            
        case 904 :
            return "sunny"
            
        default :
            return "dunno"
        }
        
    }
}


