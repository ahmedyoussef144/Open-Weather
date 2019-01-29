//
//  Extention.swift
//  Open Weather
//
//  Created by Ahmed Zaki on 1/29/19.
//  Copyright © 2019 Ahmed Zaki. All rights reserved.
//

import Foundation

extension Date
{
    func dayOfTheWeek() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}

