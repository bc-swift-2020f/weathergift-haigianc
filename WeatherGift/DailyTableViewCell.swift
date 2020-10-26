//
//  DailyTableViewCell.swift
//  WeatherGift
//
//  Created by Claudine Haigian on 10/25/20.
//  Copyright © 2020 Claudine Haigian. All rights reserved.
//

import UIKit

class DailyTableViewCell: UITableViewCell {
    @IBOutlet weak var dailyImageView: UIImageView!
    @IBOutlet weak var dailyWeekdayLabel: UILabel!
    @IBOutlet weak var dailyHighLabel: UILabel!
    @IBOutlet weak var dailySummaryView: UITextView!
    @IBOutlet weak var dailyLowLabel: UILabel!
    
    var dailyWeater: DailyWeather! {
        didSet{
            dailyImageView.image = UIImage(named: dailyWeater.dailyIcon)
            dailyWeekdayLabel.text = dailyWeater.dailyWeekday
            dailySummaryView.text = dailyWeater.dailySummary
            dailyHighLabel.text = "\(dailyWeater.dailyHigh)°"
            dailyLowLabel.text = "\(dailyWeater.dailyLow)°"
        }
    }

}
