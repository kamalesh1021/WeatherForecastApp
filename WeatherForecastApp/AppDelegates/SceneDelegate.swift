//
//  SceneDelegate.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 09/12/23.
//

import UIKit
import CoreLocation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var locationManager: CLLocationManager?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        DispatchQueue.global(qos: .background).async {
            self.requestLocationPermission()
        }
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

// MARK: - SceneDelegate Extension Conforming to CLLocationManagerDelegate

extension SceneDelegate : CLLocationManagerDelegate {
    
    // MARK: - Request Location Permission Method

        /// Requests location permission from the user.
    func requestLocationPermission() {
        // Initialize and configure the CLLocationManager
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
        // Check if location services are enabled
        if CLLocationManager.locationServicesEnabled() {
            // Request location authorization on the main thread
           
                self.locationManager?.requestWhenInUseAuthorization()
        

        } else {
            print("Not Handled")
        }
    }
    
    // MARK: - CLLocationManagerDelegate Methods
    
    /// Called when the authorization status for the app changes.
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            // Location services are authorized, proceed with your logic
            break
        case .denied, .restricted:
            // Handle the case where the user denied or restricted location access
            break
        case .notDetermined:
            // Handle the case where authorization status is not determined yet
            break
        @unknown default:
            break
        }
    }
    
    // MARK: - Show Permission Denied Alert and Exit Method

        /// Shows an alert when location access is denied and exits the app if the user cancels.
    func showPermissionDeniedAlertAndExit() {
        let alertController = UIAlertController(
            title: "Location Access Denied",
            message: "This app requires location access. Please enable location access in Settings to go further",
            preferredStyle: .alert
        )
        // Action to open app settings
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { _ in
            if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
            }
        }
        // Action to cancel and exit the app
        alertController.addAction(settingsAction)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            exit(EXIT_FAILURE) // This will exit the app
        }))
        // Present the alert from the root view controller
        window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
