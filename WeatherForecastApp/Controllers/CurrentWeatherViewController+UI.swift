//
//  CurrentWeatherViewController+UI.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 14/12/23.
//

import UIKit

extension CurrentWeatherViewController {
    
    // Reloads the data in the Forecast table view.
    /// Reloads the data in the Forecast table view.
    func reloadTableView(){
        self.forecastRecordTableView.reloadData()
    }
    
    /// Reloads the data in the Daily Weather collection view.
    func reloadColllectionView(){
        self.dailyWeatherCollectionView.reloadData()
    }
    
    // MARK: - UI Configuration
    /// Configures the entire UI, including table and collection views, labels, and weather icons.
    func configureUI(){
        reloadTableView()
        reloadColllectionView()
        setUpLabel()
        setUpWeatherIcon()
    }
    
    // MARK: - Label Setup
    /// Sets up labels with location, date, time, temperature, and weather description.
    func setUpLabel(){
        placeLabel.text = currentLocation?.combinedAddress
        dateLabel.text = currentLocation?.formattedLocalDate
        timeLabel.text = currentLocation?.formattedLocalTime
        temperatureLabel.text = currentWeatherModel?.currentTemperature
        weatherDescrptionLabel.text = currentWeatherModel?.condition?.text
    }
    
    // MARK: - Weather Icon Setup
    /// Sets up the weather icon based on the current weather condition and time of day.
    func setUpWeatherIcon(){
        if let weatherCode = conditionModel?.code {
            if let weatherType = WeatherCode(rawValue: weatherCode) {
                if let image = iconImage(for: weatherType, isDay: currentWeatherModel?.is_day ?? 0) {
                    print(image)
                    cureentWeatherIcon.image = UIImage(named: image)
                }
            }
        }
    }
}
