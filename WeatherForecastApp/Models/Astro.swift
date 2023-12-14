//
//  CurrentWeatherViewController.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 09/12/23.
//

import Foundation

struct Astro : Codable {
	let sunrise : String?
	let sunset : String?
	let moonrise : String?
	let moonset : String?
	let moon_phase : String?
	let moon_illumination : Int?
	let is_moon_up : Int?
	let is_sun_up : Int?

	enum CodingKeys: String, CodingKey {

		case sunrise = "sunrise"
		case sunset = "sunset"
		case moonrise = "moonrise"
		case moonset = "moonset"
		case moon_phase = "moon_phase"
		case moon_illumination = "moon_illumination"
		case is_moon_up = "is_moon_up"
		case is_sun_up = "is_sun_up"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		sunrise = try values.decodeIfPresent(String.self, forKey: .sunrise)
		sunset = try values.decodeIfPresent(String.self, forKey: .sunset)
		moonrise = try values.decodeIfPresent(String.self, forKey: .moonrise)
		moonset = try values.decodeIfPresent(String.self, forKey: .moonset)
		moon_phase = try values.decodeIfPresent(String.self, forKey: .moon_phase)
		moon_illumination = try values.decodeIfPresent(Int.self, forKey: .moon_illumination)
		is_moon_up = try values.decodeIfPresent(Int.self, forKey: .is_moon_up)
		is_sun_up = try values.decodeIfPresent(Int.self, forKey: .is_sun_up)
	}

}
