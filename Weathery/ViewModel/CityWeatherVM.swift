//
//  WeatherViewModel.swift
//  Weathery
//
//  Created by AlecNipp on 11/8/22.
//

import Foundation


/// A wrapper struct that will contain all the logic for presenting our Weather data.
/// It accepts a `Weather` struct, and contains methods for representing the data contained in that struct
struct CityWeatherVM {
    
    /// The weather data being processed by this view model
    let model: Weather
    var temperatureMeasurement: String
    
    var minTemp: String {
        guard var minC = model.main?.tempMin else { return "No temp" }
        minC = floor(minC - 273.15)
        
        guard var minF = model.main?.tempMin else { return "No temp" }
        minF = floor((((minF - 273.15) * 9) / 5) + 32)
        
        guard var minK = model.main?.tempMin else { return "No temp" }
        minK = floor(minK)

        switch temperatureMeasurement {
            case "Celsius":
                return "\(minC) C°"

            case "Fahrenheit":
                return "\(minF) F°"

            case "Kelvin":
                return "\(minK) K°"

            default:
                return "no temp :("
        }
    }
    
    var maxTemp: String {
        guard var maxC = model.main?.tempMax else { return "No temp" }
        maxC = floor(maxC - 273.15)
        
        guard var maxF = model.main?.tempMax else { return "No temp" }
        maxF = floor((((maxF - 273.15) * 9) / 5) + 32)
        
        guard var maxK = model.main?.tempMax else { return "No temp" }
        maxK = floor(maxK)

        switch temperatureMeasurement {
            case "Celsius":
                return "\(maxC) C°"

            case "Fahrenheit":
                return "\(maxF) F°"

            case "Kelvin":
                return "\(maxK) K°"

            default:
                return "no temp :("
        }
    }
    
    var currTemp: String {
        guard var tempC = model.main?.temp else { return "No temp" }
        tempC = floor(tempC - 273.15)
        
        guard var tempF = model.main?.temp else { return "No temp" }
        tempF = floor((((tempF - 273.15) * 9) / 5) + 32)
        
        guard var tempK = model.main?.temp else { return "No temp" }
        tempK = floor(tempK)
        
        switch temperatureMeasurement {
            case "Celsius":
                return "\(tempC) C°"

            case "Fahrenheit":
                return "\(tempF) F°"

            case "Kelvin":
                return "\(tempK) K°"

            default:
                return "no temp :("
        }
    }
    
    
    var icon: String {
        guard let icon = model.weather?[0].icon else { return "what" } //reevaluate the index here
        return "https://openweathermap.org/img/wn/\(icon)@2x.png"
    }
    
    var description: String {
        guard let description = model.weather?[0].weatherDescription else { return "what" } //reevaluate the index here
        return description
    }
    
    /// A getter that returns the formatted temperature, or "No temp" if no data is available. It's currently in Kelvin.
    
    var cityName: String {
        return model.name ?? "No name"
    }
}
