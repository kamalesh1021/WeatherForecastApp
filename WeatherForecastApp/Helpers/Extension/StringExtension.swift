//
//  StringExtension.swift
//  WeatherForecastApp
//
//  Created by Empulse on 14/12/23.
//

import UIKit

extension String {
    
    static func concatenate(_ strings: String..., withSeparator separator: String = ", ") -> String {
        return strings.joined(separator: separator)
    }
    
    func formatDate(with format: DateFormat,timeStaamp:Bool) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = !timeStaamp ? "yyyy-MM-dd HH:mm" : "yyyy-MM-dd"
                // Convert the string to a Date
                if let date = dateFormatter.date(from: self) {
                    // Create another DateFormatter to format the date
                    let formattedDateFormatter = DateFormatter()
                    formattedDateFormatter.dateFormat = format.rawValue

                    // Format the date
                    return formattedDateFormatter.string(from: date)
                } else {
                    return  "\(Date())"
                }
    }
    
    func alertMsg(_ msg:String,_ btnTitle:String,_ actnBlock:@escaping (UIAlertAction) ->()) -> UIAlertController {
        let alert:UIAlertController = UIAlertController(title: self, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: .default, handler: actnBlock))
        return alert
    }
    
    func alert(_ title:String,_ message:String,_ btnTitle:String,_ actnBlock:@escaping (UIAlertAction) ->()) -> UIAlertController {
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: .default, handler: actnBlock))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        return alert
    }
}
