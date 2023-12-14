//
//  DateEnum.swift
//  WeatherForecastApp
//
//  Created by Empulse on 14/12/23.
//

import Foundation

enum DateFormat: String {
    case iso8601 = "yyyy-MM-dd'T'HH:mm:ssZ"
    case customFormat = "MMM,d, yyyy"
    case shortDate = "MM/dd/yyyy"
    case timeOnly = "HH:mm:ss"
    case dayMonthYear = "dd-MM-yyyy"
    case shortMonth = "MMM d, yyyy"
    case dayHour = "EEEE, h:mm a"
    case hourShift = "h a"
    case weekOnly = "EEEE"
}
