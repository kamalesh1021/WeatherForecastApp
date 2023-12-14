//
//  CurrentWeatherViewController.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 09/12/23.
//

import UIKit
import CoreLocation

class CurrentWeatherViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var pullToRefreshScrollView : UIScrollView!
    @IBOutlet weak var gradientView : UIView!
    @IBOutlet weak var cureentWeatherIcon : UIImageView!
    @IBOutlet weak var dailyWeatherCollectionView: UICollectionView!
    @IBOutlet weak var forecastRecordTableView: UITableView!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherDescrptionLabel: UILabel!
    
    // MARK: - Variables
     let currentWeatherViewModel = CurrentWeatherViewModel()
     var currentWeatherModel : Current?
     var currentLocation : Location?
     var conditionModel : Condition?
     var ForecastdayModel : [Forecastday]?
     var hourModel : [Hour]?
     private let refreshControl = UIRefreshControl()
    
    // MARK: - ViewLifecycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchLocation()
    }
    
    // MARK: - EventHandler Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "idForecastSearchViewController" {
            if let destinationVC = segue.destination as? ForecastSearchViewController {
                destinationVC.delegate = self
            }
        }
    }
    
    // MARK: - Actions
    @objc func refresh() {
        fetchLocation()
        refreshControl.endRefreshing()
    }
    
    // MARK: - ScrollView Refresh
    func scrollToRefresh(){
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        pullToRefreshScrollView.refreshControl = refreshControl
    }
    
    // MARK: - Custom Methods
    func setupUI(){
        setupTableview()
        setupCollectionView()
        scrollToRefresh()
        setupDelegate()
    }
    
    ///MARK: Register TableView
    func setupTableview(){
        forecastRecordTableView.register(UINib(nibName: "ForecastTableViewCell", bundle: nil), forCellReuseIdentifier: "ForecastTableViewCell")
    }
    
    ///MARK : Register CollectionView
    func setupCollectionView(){
        dailyWeatherCollectionView.register(UINib(nibName: "DailyWeatherDetailsCell", bundle: nil), forCellWithReuseIdentifier: "DailyWeatherDetailsCell")
    }
    
     ///MARK :
    func setupDelegate(){
        currentWeatherViewModel.delegate = self
    }
    
    // MARK: - Current Location Methods
    private func fetchLocation() {
        showHud()
        LocationManager.shared.getCurrentLocation { coordinates, error in
            if let currentCoordinates = coordinates {
                print("location -->\(String(describing: coordinates))")
                let currentCoordinatesString = "\(currentCoordinates.coordinate.latitude),\(currentCoordinates.coordinate.longitude)"
                self.getWeatherReportDetails(currentCoordinatesString)
            } else if error != nil {
                print("Location Update error\(String(describing: error))")
                
            }
        }
    }
    
    //MARK: -  APICalling Methods
    func getWeatherReportDetails(_ currentCoordinatesString : String){
        self.currentWeatherViewModel.fetchWeatherData(currentCoordinatesString)
    }
}

