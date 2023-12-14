//
//  DateEnum.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 14/12/23.
//

import Foundation

// Enum representing various date formats
enum DateFormat: String {
    // ISO 8601 format including time zone.
    case iso8601 = "yyyy-MM-dd'T'HH:mm:ssZ"
    // Custom date format with month abbreviation, day, and year.
    case customFormat = "MMM,d, yyyy"
    // Short date format with month, day, and year.
    case shortDate = "MM/dd/yyyy"
    // Time-only format including hours, minutes, and seconds.
    case timeOnly = "HH:mm:ss"
    // Date format with day, month, and year components.
    case dayMonthYear = "dd-MM-yyyy"
    // Short date format with month abbreviation, day, and year.
    case shortMonth = "MMM d, yyyy"
    // Date format with day, hour, and AM/PM indicator.
    case dayHour = "EEEE, h:mm a"
    // Date format with hour and AM/PM indicator.
    case hourShift = "h a"
    // Date format displaying only the day of the week.
    case weekOnly = "EEEE"
}
