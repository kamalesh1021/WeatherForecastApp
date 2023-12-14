//
//  ApiService.swift
//  WeatherForecastApp
//
//  Created by kamalesh on 11/12/23.
//

import Foundation
import Alamofire
import Combine

class ApiService {
    
    // MARK: Shared Instance
    static let shared = ApiService()

    // MARK: Private Initializer
    private init() {}

    
    //MARK: Returns: A publisher that emits the decoded response or an error.
    func fetchData<T: Decodable>(url: URL, parameters: [String: Any]) -> AnyPublisher<T, Error> {
        return AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString))
            .publishDecodable(type: T.self)
            .tryMap { response in
                do {
                    // Decode the response into the specified type 'T'
                    let weatherData = try JSONDecoder().decode(T.self, from: response.data ?? Data())
                    return weatherData
                } catch {
                    // Throw an error if decoding fails
                    throw AFError.responseSerializationFailed(reason: .decodingFailed(error: error))
                }
            }
            .receive(on: DispatchQueue.main)// Ensure the publisher sends events on the main thread
            .eraseToAnyPublisher() // Erase the type for better abstraction
    }
    
}
