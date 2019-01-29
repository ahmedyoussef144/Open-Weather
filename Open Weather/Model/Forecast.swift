//
//  Forecast.swift
//  Open Weather
//
//  Created by Ahmed Zaki on 1/28/19.
//  Copyright © 2019 Ahmed Zaki. All rights reserved.
//

import Foundation

class Forecast
{
    private var _forecastTemp : Double!
    private var _forecastDate : String!
    init ()
    {
        
    }
    init(forecastDate : String , forecastTemp : Double)
    {
        self._forecastDate = forecastDate
        self._forecastTemp = forecastTemp
    }
    var forecastTemp: Double
    {
        if _forecastTemp == nil
        {
            _forecastTemp = 0.0
        }
        return _forecastTemp
    }
    
    var forecastDate: String
    {
        if _forecastDate == nil
        {
            _forecastDate = ""
        }
        return _forecastDate
    }
}

