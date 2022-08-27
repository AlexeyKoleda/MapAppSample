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
    
    /// Controls showing list of locations
    @Published var showLocationList: Bool = false
    
    /// Show location details via sheet
    @Published var sheetLocation: Location? = nil
    
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
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
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
    
    func nextButtonPressed() {
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Could not find current index in locations array.")
            return
        }
        
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else { return }
            showNewLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNewLocation(location: nextLocation)
    }
}
