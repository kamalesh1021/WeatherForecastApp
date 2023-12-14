//
//  Extension.swift
//  WeatherForecastApp
//
//  Created by Empulse on 10/12/23.
//

import UIKit

extension Double {
    func formattedTemperature() -> String {
       let formattedTemperature = String(format: "%.f", self) + "°"
       return formattedTemperature
   }
}





