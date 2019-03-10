//
//  ForecastTabelCell.swift
//  Open Weather
//
//  Created by Ahmed Zaki on 2/3/19.
//  Copyright © 2019 Ahmed Zaki. All rights reserved.
//

import UIKit

class ForecastTabelCell: UITableViewCell
{    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var condtionImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateForecastCell(weather : CurrentWeather)
    {
        dayLabel.text = weather.currentDate
        condtionImage.image = UIImage(named: weather.icon)
        tempLabel.text = "\(Int(weather.currentTemp!))˚"
    }

}
