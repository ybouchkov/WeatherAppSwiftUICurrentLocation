//
//  LocationManager.swift
//  WeatherAppSwiftUICurrentLocation
//
//  Created by Yani Buchkov on 4.01.22.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    // MARK: - Properties
    let manager = CLLocationManager()
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading: Bool = false
    
    // MARK: - Init
    override init() {
        super.init()
        manager.delegate = self
    }
    
    // MARK: - Methods
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
        print("🚀🚀Successfully updating locations: \(location.debugDescription)🚀🚀")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("🚩🚩Error occured: \(error)🚩🚩")
        isLoading = false
    }
}

