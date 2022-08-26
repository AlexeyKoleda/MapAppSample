//
//  LocationsViewModel.swift
//  MapAppSample
//
//  Created by Alexey Koleda on 26.08.2022.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    let defaultMapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    /// All loaded locations
    @Published var locations: [Location]
    /// Current location
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    init(_ locations: [Location]) {
        let firstLocation = locations.first!
        self.locations = locations
        self.mapLocation = firstLocation
        self.updateMapRegion(location: firstLocation)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: defaultMapSpan
            )
        }
    }
}
