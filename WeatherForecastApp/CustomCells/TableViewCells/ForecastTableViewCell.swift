//
//  ForecastTableViewCell.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 11/12/23.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    
    //MARK: - Outlets
    @IBOutlet weak var temperatureLabel : UILabel!
    @IBOutlet weak var  dateLabel: UILabel!
    @IBOutlet weak var  dayLabel: UILabel!
    @IBOutlet weak var weatherIcon : UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func filterCommonValues(_ hours: [Hour]) -> [Hour] {
        // Add your filtering conditions here
        // For example, filter based on temperature, condition code, and isDay
        return hours.filter { hour in
            return hour.temp_c! > 18.0 && hour.is_day == 1
        }
    }

    func setUpForcastUI(_ indexPath: Forecastday) {
        self.temperatureLabel.text = indexPath.day?.avgtemp_c?.formattedTemperature()
        self.dateLabel.text = indexPath.formattedDate
        self.dayLabel.text = indexPath.formattedWeek

        //filterCommonValues function to get filtered hours
        let filteredHours = filterCommonValues(indexPath.hour ?? [])

        if let isDay = filteredHours.first {
            if let weatherCode = indexPath.day?.condition?.code,
               let weatherType = WeatherCode(rawValue: weatherCode),
               let image = iconImage(for: weatherType, isDay: isDay.is_day ?? 0) {
                print(image)
                weatherIcon.image = UIImage(named: image)
            }
        }
    }
}
