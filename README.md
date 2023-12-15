# Weather Forecast App

## Overview

This Weather Forecast App provides users with up-to-date weather information, including current conditions and forecasts.

## Features

- **Current Weather:** Display current weather conditions.
- **Forecast:** Show weather forecasts for the upcoming days.
- **Location-based:** Get weather information based on the user's location.
- **User-friendly UI:** Intuitive and easy-to-use interface.

## Screenshots

 ![CurrentLocation](https://github.com/kamalesh1021/WeatherForecastApp/assets/153336530/4503e647-0d03-4cd1-817d-58b532893e47) 
 ![SearchView](https://github.com/kamalesh1021/WeatherForecastApp/assets/153336530/366158e7-ab62-44ae-9815-e56fdc6ada2b)


### Prerequisites

- iOS device or simulator running iOS 14.0+
- Xcode 12.0 or later
- Swift 5.0 or later

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/kamalesh1021/WeatherForecastApp.git
2. Open the project in Xcode.
3. Install dependencies using CocoaPods:
   ```bash
   cd WeatherForecastApp
   pod install
   
## Usage

Welcome to the Weather Forecast App! This section provides guidance on using the application effectively.

### Getting Started

1. **Launch the App:** Open the Weather Forecast App on your device.
2. **Location Permission:** Ensure that the app has permission to access your device's location for accurate weather forecasts.
3. **Main Screen:** The main screen displays the current weather information for your location.

### Search by City or ZIP Code

- **Search Feature:** Use the search feature to find weather information for specific cities or ZIP codes.
- **Supported Regions:** The app supports weather information for cities and ZIP codes in the UK, US, and Canada.
- **How to Search:**
  - *By City:* Enter the name of the city in the search bar and select from the suggestions.
  - *By ZIP Code:* Enter the ZIP code in the search bar and view the weather details.

### Features

#### Current Weather

- **Temperature:** View the current temperature in Celsius.
- **Conditions:** Check the current weather conditions, such as clear skies, rain, or snow.

#### Forecast

- **Detailed Forecast:** Swipe Today Weather to see all the hourly Details.

### Settings

- **Location Settings:** Adjust location settings for accurate weather information.

### Troubleshooting

If you encounter any issues or have questions:

- **Check Internet Connection:** Ensure your device has a stable internet connection for real-time weather updates.
- **Permissions:** Verify that the app has the necessary permissions to access location data.
 

## Architecture

Welcome to the Weather Forecast App! This section provides insights into the architectural choices made for the project.

### Design Patterns(MVVM)

The Weather Forecast App follows a combination of the Singleton and MVVM (Model-View-ViewModel) design patterns to achieve a scalable and maintainable architecture.

#### Singleton Pattern

- **Purpose:** The Singleton pattern ensures that a class has only one instance and provides a global point of access to that instance.
- **Implementation:** The `ProgressHud` class is implemented as a Singleton, accessible throughout the app to manage loading indicators efficiently.
- **Implementation:** The `LocationManager` class is implemented as a Singleton, accessible throughout the app to manage loading Location Service efficiently.

MVVM (Model-View-ViewModel) Pattern
Purpose: MVVM separates the application logic into three components: Model, View, and ViewModel. This promotes a clean and organized structure, making it easier to maintain and test.
Components:
Model: Represents the data and business logic. In the Weather Forecast App, the data models for weather information and user settings are part of the Model.
View: Represents the user interface. Custom UIView subclasses, such as GradientView and RoundedCornerView, follow the View aspect.
ViewModel: Acts as an intermediary between the Model and View, handling data presentation and user interactions. The ViewModel logic is implemented in Swift files associated with specific views.

## Dependencies

The Weather Forecast App leverages external libraries to enhance functionality. Below is a list of dependencies and their roles:

### Alamofire

- **Description:** Alamofire is an HTTP networking library written in Swift, widely used for simplifying network requests and responses.
- **Purpose:** In the Weather Forecast App, Alamofire is utilized for making API requests to fetch weather data efficiently.
- **Integration:**
  - Alamofire is integrated into the project using CocoaPods. Make sure you have CocoaPods installed on your machine.
  - Add the following line to your `Podfile`:

    ```ruby
    pod 'Alamofire', '~> 5.8'
    ```
  - Run `pod install` in the terminal to install the Alamofire dependency.

### Benefits of Alamofire Integration

- **Simplified Networking:** Alamofire streamlines the process of making network requests, handling responses, and managing data serialization.
- **Robust and Reliable:** Leveraging a well-established library like Alamofire ensures reliable and stable networking capabilities.
- **Community Support:** Alamofire is actively maintained by the community, providing updates and support for the latest Swift and iOS versions.


## Weather API Integration

The Weather Forecast App leverages the WeatherAPI service to provide accurate and up-to-date weather information. Below are the details on how the WeatherAPI is configured within the app: 
- Source Website : www.weatherapi.com
- API KEY Vaild till 25/12/2023
- If API KEY expired Please checkout the www.weatherapi.com

### WeatherAPI Configuration

- **Base URL:** The base URL for the WeatherAPI service is specified in the `APIConfigure.plist` file within the app's source code.
- **API Key:** To access the WeatherAPI and fetch weather data, an API key is required. The key is securely stored and can be found in the `APIConfigure.plist` file.

### Accessing the WeatherAPI

To access weather data, follow these steps:

1. Locate the `APIConfigure.plist` file in the app's source code.
2. Retrieve the base URL and API key from the plist file.
3. Construct your API requests using the base URL, and include the API key in the request headers.

## Conclusion

In conclusion, the README serves as a crucial guide for anyone interacting with the Weather Forecast App. Whether you're a developer looking to contribute, a user exploring the app, or a potential client evaluating the project, the README provides vital information to streamline your experience.


