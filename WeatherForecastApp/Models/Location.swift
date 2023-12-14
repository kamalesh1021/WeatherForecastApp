//
//  CurrentWeatherViewController.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 09/12/23.
//

import Foundation

struct Location : Codable {
    let name : String?
    let region : String?
    let country : String?
    let lat : Double?
    let lon : Double?
    let tz_id : String?
    let localtime_epoch : Int?
    let localtime : String?
    
    // Gets the formatted local date in short month format.
    var formattedLocalDate: String? {
        guard let localtime = localtime?.formatDate(with: .shortMonth, timeStaamp: false) else { return "N/A" }
        return localtime
    }
    
    // Gets the formatted local time in day and hour format.
    var formattedLocalTime: String? {
        guard let localtime = localtime?.formatDate(with: .dayHour, timeStaamp: false) else { return "N/A" }
        return localtime
    }
    
    // Combines the name, region, and country into a single address string.
    var combinedAddress : String?{
        var combinedString : String?
        if let name = name,let region = region,let country = country {
            combinedString = "\(name), \(region), \(country)"
        } else {
            combinedString = "N/A"
        }
        return combinedString
    }
    
   
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case region = "region"
        case country = "country"
        case lat = "lat"
        case lon = "lon"
        case tz_id = "tz_id"
        case localtime_epoch = "localtime_epoch"
        case localtime = "localtime"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lon = try values.decodeIfPresent(Double.self, forKey: .lon)
        tz_id = try values.decodeIfPresent(String.self, forKey: .tz_id)
        localtime_epoch = try values.decodeIfPresent(Int.self, forKey: .localtime_epoch)
        localtime = try values.decodeIfPresent(String.self, forKey: .localtime)
    }
}
