//
//  Extras.swift
//  Open Weather
//
//  Created by Ahmed Zaki on 1/25/19.
//  Copyright © 2019 Ahmed Zaki. All rights reserved.
//

import Foundation
var API_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=53124abdfe51bb8c81b556680de6037c"
let FORECAST_API_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=16&appid=7c609f73c5df2dff2f32e3e3cc33cd23"
typealias downloadComplete = () -> ()

func convertDate(timeInterval : Double) -> String
{
    let tempDate = Date(timeIntervalSince1970: timeInterval)
    let dateFormater = DateFormatter()
    dateFormater.dateStyle = .medium
    dateFormater.timeStyle = .none
    let date = dateFormater.string(from: tempDate)
    return date
}
