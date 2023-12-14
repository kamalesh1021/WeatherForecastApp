//
//  WeatherAPIRequest.swift
//  WeatherForecastApp
//
//  Created by Empulse on 14/12/23.
//

import Foundation
// Enum defining keys for Weather API requests
enum WeatherAPIRequest: String {
    case apiKey = "key"
    case location = "q"
    case days = "days"
    case aqi = "aqi"
    case alerts = "alerts"
}

