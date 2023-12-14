//
//  CurrentWeatherViewModel.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 11/12/23.
//

import Foundation
import Combine


// MARK: - CurrentWeatherViewModelDelegate Protocol
protocol CurrentWeatherViewModelDelegate: AnyObject {
    func didReceiveData(_ data: WeatherResponse)
    func didFail(with error: Error)
}


// MARK: - CurrentWeatherViewModel Class
class CurrentWeatherViewModel: ObservableObject {
    
    // MARK: Published Property
    @Published var data: WeatherResponse?
    
    
    // MARK: Private Properties
    private var cancellables = Set<AnyCancellable>()
    private let apiService: ApiService
    weak var delegate: CurrentWeatherViewModelDelegate?
    
    // MARK: Initializer
    init(apiService: ApiService = ApiService.shared) {
        self.apiService = apiService
    }
    
    // MARK: Fetch Data Method
    func fetchWeatherData(_ location: String) {
        // Construct URL for the weather forecast API
        guard let path = Bundle.main.path(forResource: "APIConfigure", ofType: "plist"),let config = NSDictionary(contentsOfFile: path),let apiKey = config["APIKey"] as? String, let APIBaseURL = config["APIBaseURL"] as? String else {
            print("Error: Unable to load API key from Config.plist")
            return
        }
        let  forecastEndPoint = "forecast.json?key"
        guard let url = URL(string: APIBaseURL + forecastEndPoint) else {
            print("Error: Invalid URL")
            return
        }
        // Load API key from Config.plist
        print(apiKey)
        // Prepare parameters for the API request
        let parameters = [WeatherAPIRequest.apiKey.rawValue: apiKey, WeatherAPIRequest.location.rawValue: location, WeatherAPIRequest.days.rawValue:"5", WeatherAPIRequest.aqi.rawValue:"no", WeatherAPIRequest.alerts.rawValue:"no"] as [String : Any]
        print("CurrentWeather URL-->\(url)")
        print("CurrentWeather parameters-->\(parameters)")
        // Perform the API request using the ApiService
        apiService.fetchData(url: url , parameters: parameters)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break // Do nothing on success
                case .failure(let error):
                    // Handle error and notify the delegate
                    print("Error fetching data: \(error)")
                    self.delegate?.didFail(with: error)
                }
            }) { [weak self] (response: WeatherResponse) in
                // Update the data property and notify the delegate on success
                self?.data = response
                self?.delegate?.didReceiveData(response)
            }
            .store(in: &cancellables)
    }
}


