//
//  LocationsViewModel.swift
//  SwiftUIMap
//
//  Created by Uriel Pacheco on 18/02/24.
//

import Foundation
import MapKit
import SwiftUI

final class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    @Published var showLocationsList: Bool = false
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        updateMapRegion(location: mapLocation)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func show(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func showNextLocation() {
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else { return }
        
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex)
        else {
            guard let firstLocation = locations.first else { return }
            show(location: firstLocation)
            return
            
        }
        
        let nextLocation = locations[nextIndex]
        show(location: nextLocation)
    }
}
