//
//  WeatherDetail.swift
//  WeatherGift
//
//  Created by Claudine Haigian on 10/13/20.
//  Copyright © 2020 Claudine Haigian. All rights reserved.
//

import Foundation

class WeatherDetail: WeatherLocation {
    
    struct Result: Codable {
        var timezone: String
        var current: Current
    }
    
    struct Current: Codable {
        var dt: TimeInterval
        var temp: Double
        var weather: [Weather]
    }
    
    struct Weather: Codable{
        var description: String
        var icon: String
    }
    
    var timezone = ""
    var currentTime = 0.0
    var temperature = 0
    var summary = ""
    var dailyIcon = ""
    
    func getData(completed: @escaping () -> ()){
        let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely&units=imperial&appid=\(APIKeys.openWeatherKey)"

        print("🕸 We are accessing the url \(urlString)")
        
        //Create URL
        guard let url = URL(string: urlString) else{
            print("😡 ERROR: Could not create a URL from \(urlString)")
            completed()
            return
        }
        
        //Create session
        let session = URLSession.shared
        
        //get the data with .dataTask method
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print("😡 ERROR:\(error.localizedDescription)")
            }
            
            //note: there are some additional things that could go wrong when using URLSession, but we shouldn't experience them, so we'll ignore testing for these now...
            
            //deal with the data
            do {
                let result = try JSONDecoder().decode(Result.self, from: data!)
                self.timezone = result.timezone
                self.currentTime = result.current.dt
                self.temperature = Int(result.current.temp.rounded())
                self.summary = result.current.weather[0].description
                self.dailyIcon = result.current.weather[0].icon
            } catch{
                print("😡 JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()
    }
}
