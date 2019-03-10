//
//  ForecastCell.swift
//  Open Weather
//
//  Created by Ahmed Zaki on 1/28/19.
//  Copyright © 2019 Ahmed Zaki. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell
{

    // Outlet
    @IBOutlet weak var forecastDate: UILabel!
    @IBOutlet weak var forcastTemp: UILabel!
    
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
    
    func updataForecastCell()
    {
     
    }

}
