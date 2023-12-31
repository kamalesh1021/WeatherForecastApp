//
//  LocationManager.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 13/12/23.
//
import UIKit
import CoreLocation


// Singleton class for managing location services.
class LocationManager: NSObject, CLLocationManagerDelegate {
    
    // MARK: - Shared Instance
    static let shared = LocationManager()
    
    // MARK: - Private Properties
    private var locationManager: CLLocationManager!
    private var completionHandler: ((CLLocation?, Error?) -> Void)?
    private var didReceiveFirstLocation = false
    
    //MARK: - Private initializer to set up the CLLocationManager.
    private override init() {
        super.init()
        setupLocationManager()
    }
    
    /// Initialize and configure the CLLocationManager.
    private func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    // MARK: - Request Location Permission Method

        // Requests location permission from the user.
    func getCurrentLocation(completion: @escaping (CLLocation?, Error?) -> Void) {
        // Check and request location permissions
        locationManager.requestWhenInUseAuthorization()
        DispatchQueue.global(qos: .background).async {
            // Check if location services are enabled
            if CLLocationManager.locationServicesEnabled() {
                // Request location authorization on the main thread
                DispatchQueue.main.async {
                    self.locationManager.delegate = self
                    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
                    self.locationManager.startUpdatingLocation()
                }
            }
        }
        // Store the completion handler to use it in the delegate methods
        self.completionHandler = { coordinates, error in
            completion(coordinates, error)
            if !self.didReceiveFirstLocation {
                self.didReceiveFirstLocation = true
                self.locationManager.delegate = nil // Unsubscribe from further location updates
            }
        }
    }
    
    // MARK: - CLLocationManagerDelegate Methods
    
    // Handle updated location information.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let coordinates = location.coordinate
            let currentLocation = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
            completionHandler?(currentLocation, nil)
            print("coordinates-->\(coordinates)")
            locationManager.stopUpdatingLocation() // Stop updates when you have the location
        }
    }
    
    // Handle location manager errors.
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        completionHandler?(nil, error)
        locationManager.stopUpdatingLocation()
    }
    
   // Called when the authorization status for the app changes.
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            // Location permission granted
            manager.startUpdatingLocation()
        } else if status == .denied || status == .restricted {
            // Location permission denied or restricted, handle accordingly
            promptUserToEnableLocation()
        }
    }
    

    //MARK: - Called when the authorization status for the app changes.
    func requestLocationPermission() {
        guard let locationManager = locationManager else {
            return
        }
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            // Location permission already granted
            setupLocationManager()
            break
        case .notDetermined:
            // Request location permission
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            // Location permission denied or restricted, prompt user to enable in settings
            promptUserToEnableLocation()
        @unknown default:
            break
        }
    }
    
    // MARK: - Show Permission Denied Alert and Exit Method

       /// Shows an alert when location access is denied and exits the app if the user cancels.
    private func promptUserToEnableLocation() {
        // Show an alert or navigate to the app settings to enable location
        let alert = UIAlertController(
            title: "Location Access",
            message: "Please enable location access in Settings to use this App.",
            preferredStyle: .alert
        )
        // Action to open app settings
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            exit(EXIT_SUCCESS)
        } ))
        // Action to open app settings
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { _ in
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
        }))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
