//
//  UIViewControllerExtension.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 14/12/23.
//

import UIKit

// Extension to simplify the display and dismissal of a progress HUD on UIViewController
extension UIViewController {

    // Method to show a progress HUD
    func showHud() {
        ProgressHud.sharedInstance.showWithBlurView()
    }
    
    // Method to hide a previously shown progress HUD
    func hideHud() {
        ProgressHud.sharedInstance.hide()
    }
}
