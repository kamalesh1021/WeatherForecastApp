//
//  ForecastSearchViewController+Delegate.swift
//  WeatherForecastApp
//
//  Created by Empulse on 14/12/23.
//

import UIKit


// MARK: - UISearchBarDelegate & UIGestureRecognizerDelegate
extension ForecastSearchViewController: UISearchBarDelegate, UIGestureRecognizerDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Handle search logic here
        if let searchText = searchBar.text, !searchText.isEmpty {
            print("Search button tapped with text: \(searchText)")
            delegate?.searchEntry(searchText)
            searchBar.resignFirstResponder()
            navigationController?.popViewController(animated: true)
        } else {
            // If search is Empty
            self.present((searchBar.text?.alertMsg("City or Zip code is empty", "OK", { (action) in
            }))!, animated: true, completion: nil)
        }
    }
}
