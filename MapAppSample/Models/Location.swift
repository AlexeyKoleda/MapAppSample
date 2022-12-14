//
//  Location.swift
//  MapAppSample
//
//  Created by Alexey Koleda on 26.08.2022.
//

import Foundation
import MapKit

struct Location {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
}

extension Location: Identifiable {
    var id: String {
        "\(name), \(cityName)"
    }
}

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
