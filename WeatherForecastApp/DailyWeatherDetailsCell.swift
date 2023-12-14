//
//  DailyWeatherDetailsCell.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 11/12/23.
//

import UIKit


class DailyWeatherDetailsCell: UICollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var  temperatureLabel: UILabel!
    @IBOutlet weak var  hourLabel: UILabel!
    @IBOutlet weak var  weatherIcon : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
   
    func setUpDailyWeatherUI(_ indexPath : Hour){
        temperatureLabel.text =  indexPath.temp_c?.formattedTemperature()
        hourLabel.text =  indexPath.time?.formatDate(with: .hourShift, timeStaamp: false)
        if let weatherCode = indexPath.condition?.code {
            if let weatherType = WeatherCode(rawValue: weatherCode) {
                if let image = iconImage(for: weatherType, isDay: indexPath.is_day ?? 0) {
                    print(image)
                    weatherIcon.image = UIImage(named: image)
                }
            }
        }
    }

}
