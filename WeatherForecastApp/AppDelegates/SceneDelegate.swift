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


extension SceneDelegate : CLLocationManagerDelegate {
    
    func requestLocationPermission() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
        if CLLocationManager.locationServicesEnabled() {
            DispatchQueue.main.async {
                self.locationManager?.requestWhenInUseAuthorization()
            }

        } else {
            print("Not Handled")
        }
    }
    
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
    
    func showPermissionDeniedAlertAndExit() {
        let alertController = UIAlertController(
            title: "Location Access Denied",
            message: "This app requires location access. Please enable location access in Settings to go further",
            preferredStyle: .alert
        )

        let settingsAction = UIAlertAction(title: "Settings", style: .default) { _ in
            if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
            }
        }
        
        alertController.addAction(settingsAction)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            exit(EXIT_FAILURE) // This will exit the app
        }))
        window?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
