//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Claudine Haigian on 10/9/20.
//  Copyright © 2020 Claudine Haigian. All rights reserved.
//

import Foundation

class WeatherLocation: Codable{
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    
    
}
