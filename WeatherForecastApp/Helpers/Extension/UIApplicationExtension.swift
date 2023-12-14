//
//  UIApplicationExtension.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 14/12/23.
//

import UIKit

// Extension to find the topmost view controller in the view hierarchy
extension UIApplication {
    
    // Method to get the topmost view controller
    class func topViewController(
        base: UIViewController? = UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController
    ) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
