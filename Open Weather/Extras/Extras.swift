//
//  Extras.swift
//  Open Weather
//
//  Created by Ahmed Zaki on 1/25/19.
//  Copyright © 2019 Ahmed Zaki. All rights reserved.
//

import Foundation
var API_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=53124abdfe51bb8c81b556680de6037c"
typealias downloadComplete = () -> ()
