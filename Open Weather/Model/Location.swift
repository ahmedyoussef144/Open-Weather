//
//  Location.swift
//  Open Weather
//
//  Created by Ahmed Zaki on 1/27/19.
//  Copyright © 2019 Ahmed Zaki. All rights reserved.
//

import Foundation

struct Location
{
    static var sharedInstance = Location()
    var longitude : Double!
    var latitude : Double!
}
