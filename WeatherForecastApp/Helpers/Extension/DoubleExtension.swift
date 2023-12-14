//
//  Extension.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 10/12/23.
//

import UIKit

// Extension for formatting a Double as a temperature string with a degree symbol
extension Double {
    func formattedTemperature() -> String {
       let formattedTemperature = String(format: "%.f", self) + "°"
       return formattedTemperature
   }
}





