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
    /// Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    /// Controls shoving list of locations
    @Published var showLocationList: Bool = false
    
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
    
    func toggleLocationList() {
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    func showNewLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
}
