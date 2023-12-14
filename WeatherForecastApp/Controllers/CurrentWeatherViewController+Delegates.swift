//
//  CurrentWeatherViewController+Delegates.swift
//  WeatherForecastApp
//
//  Created by Empulse on 14/12/23.
//

import UIKit
import CoreLocation


 // MARK: - UICollectionViewDataSource
extension CurrentWeatherViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "DailyWeatherDetailsCell", for: indexPath) as! DailyWeatherDetailsCell
        if let hourModel = hourModel, indexPath.row < hourModel.count {
            let hour = hourModel[indexPath.row]
            cell.setUpDailyWeatherUI(hour)
        }
        return cell
    }
}

//MARK: - UITableViewDataSource

extension CurrentWeatherViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ForecastdayModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "ForecastTableViewCell", for: indexPath) as! ForecastTableViewCell
        // Configure the cell with data from the hourModel
        if let hourModel = ForecastdayModel, indexPath.row < hourModel.count {
            let hour = hourModel[indexPath.row]
            cell.setUpForcastUI(hour)
        }
        return cell
    }
}


// MARK: - CurrentWeatherViewModelDelegate Handles Response of Sucess and Failure
extension CurrentWeatherViewController : CurrentWeatherViewModelDelegate {
    
    //MARK: Sucess Methoad
    func didReceiveData(_ data: WeatherResponse) {
        print(data)
        if !(data.current == nil) {
            conFigureModel(data)
            configureUI()
            hideHud()
        } else {
            showAlert()
        }
    }
    
    //MARK: Failure Methoad
    func didFail(with error: Error) {
        print("didFail -->\(error)")
        showAlert()
    }
    
    //MARK: Assigng To Model
    func conFigureModel(_ data : WeatherResponse){
        self.currentWeatherModel = data.current
        self.currentLocation = data.location
        self.conditionModel = data.current?.condition
        self.ForecastdayModel = data.forecast?.forecastday
        if let firstForecastday = data.forecast?.forecastday?.first {
            self.hourModel = firstForecastday.hour
        }
    }
    
    //MARK: Alert For User
    func showAlert(){
        hideHud()
        let alertString = "Search Location Not Found"
        self.present((alertString.alertMsg("Please check the  city speling or Zip code your enterd", "OK", { (action) in
            print(alertString)
        })), animated: true, completion: nil)
    }
}

// MARK: - SearchViewDelegate Handles Searched City
extension CurrentWeatherViewController : SearchViewDelegate {
    func searchEntry(_ data: String) {
        showHud()
        self.getWeatherReportDetails(data)
    }
}
