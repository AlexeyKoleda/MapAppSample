//
//  LocationViewModel.swift
//  MapAppSample
//
//  Created by Alexey Koleda on 26.08.2022.
//

import Foundation

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    init(_ locations: [Location]) {
        self.locations = locations
    }
}
