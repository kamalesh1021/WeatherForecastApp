//
//  CurrentWeatherViewController.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 09/12/23.
//

import Foundation

struct Forecastday : Codable {
	let date : String?
	let date_epoch : Int?
	let day : Day?
	let astro : Astro?
	let hour : [Hour]?
    
    
    
    var formattedDate: String? {
        guard let localtime = date?.formatDate(with: .shortMonth, timeStaamp: true) else { return "N/A" }
        return localtime
    }
    
    var formattedWeek: String? {
        guard let localtime = date?.formatDate(with: .weekOnly, timeStaamp: true) else { return "N/A" }
        return localtime
    }
    

	enum CodingKeys: String, CodingKey {

		case date = "date"
		case date_epoch = "date_epoch"
		case day = "day"
		case astro = "astro"
		case hour = "hour"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		date_epoch = try values.decodeIfPresent(Int.self, forKey: .date_epoch)
		day = try values.decodeIfPresent(Day.self, forKey: .day)
		astro = try values.decodeIfPresent(Astro.self, forKey: .astro)
		hour = try values.decodeIfPresent([Hour].self, forKey: .hour)
	}

}
