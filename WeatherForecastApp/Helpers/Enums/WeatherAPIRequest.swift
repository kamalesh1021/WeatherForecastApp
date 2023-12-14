//
//  WeatherAPIRequest.swift
//  WeatherForecastApp
//
//  Created by Empulse on 14/12/23.
//

import Foundation

enum WeatherAPIRequest: String {
    case apiKey = "key"
    case location = "q"
    case days = "days"
    case aqi = "aqi"
    case alerts = "alerts"
}
