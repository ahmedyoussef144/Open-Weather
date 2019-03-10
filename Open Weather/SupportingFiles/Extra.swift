//
//  Extra.swift
//  Open Weather
//
//  Created by Ahmed Zaki on 2/3/19.
//  Copyright © 2019 Ahmed Zaki. All rights reserved.
//

import Foundation


let API_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let Token_key = "7c609f73c5df2dff2f32e3e3cc33cd23"
let Num_Day = "16"

typealias downloadComplete = ([CurrentWeather]) -> ()

func convertDate(timeInterval : Double) -> String
{
    let tempDate = Date(timeIntervalSince1970: timeInterval)
    let dateFormater = DateFormatter()
    dateFormater.dateStyle = .medium
    dateFormater.timeStyle = .none
    let date = dateFormater.string(from: tempDate)
    return date

}

extension Date
{
    func dayOfTheWeek() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
