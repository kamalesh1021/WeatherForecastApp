//
//  ForecastSearchViewController.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 09/12/23.
//

import UIKit

// MARK: - SearchViewDelegate Protocol
protocol SearchViewDelegate: AnyObject {
    func searchEntry(_ data: String)
}


class ForecastSearchViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var searchCity: UISearchBar!
    @IBOutlet weak var clearBtn: UIButton!
    
    
    // MARK: - Variables
    weak var delegate: SearchViewDelegate?

    // MARK: - ViewLifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        searchCity.delegate = self
        // Swipe to interactivePopGestureRecognizer
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self
        // Open the keyboard when the view appears
        searchCity.becomeFirstResponder()
    }
    
}


