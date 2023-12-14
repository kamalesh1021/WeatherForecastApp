//
//  ProgressHud.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 14/12/23.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

// `ProgressHud` is a class providing a shared instance for displaying progress HUDs.
class ProgressHud {
    // Shared instance for accessing the `ProgressHud` functionality.
    static let sharedInstance = ProgressHud()

    var container = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    var subContainer = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width / 3.0, height: UIScreen.main.bounds.width / 4.0))
    var textLabel = UILabel()
    var activityIndicatorView = UIActivityIndicatorView()
    var blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))

    private init() {
        // Main Container
        container.backgroundColor = UIColor.clear

        // Sub Container
        subContainer.layer.cornerRadius = 5.0
        subContainer.layer.masksToBounds = true
        subContainer.backgroundColor = UIColor.clear

        // Activity Indicator
        activityIndicatorView.hidesWhenStopped = true

        // Text Label
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 0
        textLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
        textLabel.textColor = UIColor.darkGray

        // Blur Effect
        // always fill the view
        blurEffectView.frame = container.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    func show() {
        container.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        activityIndicatorView.style = UIActivityIndicatorView.Style.large
        activityIndicatorView.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        activityIndicatorView.color = UIColor.gray

        activityIndicatorView.startAnimating()
        container.addSubview(activityIndicatorView)

        if let topViewController = getTopViewController() {
            topViewController.view.addSubview(container)
        }

        container.alpha = 0.0
        UIView.animate(withDuration: 0.5) {
            self.container.alpha = 1.0
        }
    }

    func showWithBlurView() {
        if !UIAccessibility.isReduceTransparencyEnabled {
            container.backgroundColor = UIColor.clear
            container.addSubview(blurEffectView)
        } else {
            container.backgroundColor = UIColor.black.withAlphaComponent(0.85)
        }

        activityIndicatorView.style = UIActivityIndicatorView.Style.large
        activityIndicatorView.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        activityIndicatorView.color = UIColor.white

        activityIndicatorView.startAnimating()
        container.addSubview(activityIndicatorView)

        if let topViewController = getTopViewController() {
            topViewController.view.addSubview(container)
        }

        container.alpha = 0.0
        UIView.animate(withDuration: 0.5) {
            self.container.alpha = 1.0
        }
    }

    func hide() {
        UIView.animate(withDuration: 0.5) {
            self.container.alpha = 0.0
        } completion: { _ in
            self.activityIndicatorView.stopAnimating()

            self.activityIndicatorView.removeFromSuperview()
            self.textLabel.removeFromSuperview()
            self.subContainer.removeFromSuperview()
            self.blurEffectView.removeFromSuperview()
            self.container.removeFromSuperview()
        }
    }

    func show(withTitle title: String?) {
        container.backgroundColor = UIColor.clear

        subContainer.backgroundColor = UIColor.systemGroupedBackground
        subContainer.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        container.addSubview(subContainer)

        activityIndicatorView.style = UIActivityIndicatorView.Style.medium
        activityIndicatorView.color = UIColor.black
        activityIndicatorView.frame = CGRect(x: 0, y: 10, width: subContainer.bounds.width, height: subContainer.bounds.height / 3.0)
        activityIndicatorView.center = CGPoint(x: activityIndicatorView.center.x, y: activityIndicatorView.center.y)
        subContainer.addSubview(activityIndicatorView)

        let height: CGFloat = subContainer.bounds.height - activityIndicatorView.bounds.height - 10.0
        textLabel.frame = CGRect(x: 5, y: 10 + activityIndicatorView.bounds.height, width: subContainer.bounds.width - 10.0, height: height - 5.0)
        textLabel.text = title
        subContainer.addSubview(textLabel)

        activityIndicatorView.startAnimating()

        if let topViewController = getTopViewController() {
            topViewController.view.addSubview(container)
        }

        container.alpha = 0.0
        UIView.animate(withDuration: 0.5) {
            self.container.alpha = 1.0
        }
    }

    func showDarkBackgroundView(withTitle title: String?) {
        container.backgroundColor = UIColor.black.withAlphaComponent(0.85)

        subContainer.backgroundColor = UIColor.systemGroupedBackground
        subContainer.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        container.addSubview(subContainer)

        activityIndicatorView.style = UIActivityIndicatorView.Style.medium
        activityIndicatorView.color = UIColor.black
        activityIndicatorView.frame = CGRect(x: 0, y: 10, width: subContainer.bounds.width, height: subContainer.bounds.height / 3.0)
        activityIndicatorView.center = CGPoint(x: activityIndicatorView.center.x, y: activityIndicatorView.center.y)
        subContainer.addSubview(activityIndicatorView)

        let height: CGFloat = subContainer.bounds.height - activityIndicatorView.bounds.height - 10.0
        textLabel.frame = CGRect(x: 5, y: 10 + activityIndicatorView.bounds.height, width: subContainer.bounds.width - 10.0, height: height - 5.0)
        textLabel.text = title
        subContainer.addSubview(textLabel)

        activityIndicatorView.startAnimating()

        if let topViewController = getTopViewController() {
            topViewController.view.addSubview(container)
        }

        container.alpha = 0.0
        UIView.animate(withDuration: 0.5) {
            self.container.alpha = 1.0
        }
    }

    func showBlurView(withTitle title: String?) {
        if !UIAccessibility.isReduceTransparencyEnabled {
            container.backgroundColor = UIColor.clear
            container.addSubview(blurEffectView)
        } else {
            container.backgroundColor = UIColor.black.withAlphaComponent(0.85)
        }

        subContainer.backgroundColor = UIColor.systemGroupedBackground
        activityIndicatorView.color = UIColor.black
        subContainer.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        container.addSubview(subContainer)

        activityIndicatorView.style = UIActivityIndicatorView.Style.medium
        activityIndicatorView.frame = CGRect(x: 0, y: 10, width: subContainer.bounds.width, height: subContainer.bounds.height / 3.0)
        activityIndicatorView.center = CGPoint(x: activityIndicatorView.center.x, y: activityIndicatorView.center.y)
        subContainer.addSubview(activityIndicatorView)

        let height: CGFloat = subContainer.bounds.height - activityIndicatorView.bounds.height - 10.0
        textLabel.frame = CGRect(x: 5, y: 10 + activityIndicatorView.bounds.height, width: subContainer.bounds.width - 10.0, height: height - 5.0)
        textLabel.text = title
        subContainer.addSubview(textLabel)

        activityIndicatorView.startAnimating()

        if let topViewController = getTopViewController() {
            topViewController.view.addSubview(container)
        }

        container.alpha = 0.0
        UIView.animate(withDuration: 0.5) {
            self.container.alpha = 1.0
        }
    }

    func updateProgressTitle(_ title: String?) {
        textLabel.text = title
    }

    private func getKeyWindow() -> UIWindow? {
        return UIApplication.shared.windows.filter { $0.isKeyWindow }.first
    }

    private func getTopViewController(base: UIViewController? = UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return getTopViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
