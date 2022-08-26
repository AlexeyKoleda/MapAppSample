//
//  MapAppSampleApp.swift
//  MapAppSample
//
//  Created by Alexey Koleda on 22.08.2022.
//

import SwiftUI

@main
struct MapAppSampleApp: App {
    
    @StateObject private var vm = LocationsViewModel(LocationsDataService.locations)
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
