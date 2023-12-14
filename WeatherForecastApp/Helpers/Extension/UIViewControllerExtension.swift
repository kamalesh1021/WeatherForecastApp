//
//  UIViewControllerExtension.swift
//  WeatherForecastApp
//
//  Created by Empulse on 14/12/23.
//

import UIKit

extension UIViewController {

    func showHud() {
        ProgressHud.sharedInstance.showWithBlurView()
    }
    
    func hideHud() {
        ProgressHud.sharedInstance.hide()
    }
}
