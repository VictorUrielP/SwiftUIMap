//
//  LocationView.swift
//  SwiftUIMap
//
//  Created by Uriel Pacheco on 18/02/24.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
    @EnvironmentObject private var locationsViewModel: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $locationsViewModel.mapRegion)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header.padding()
                
                Spacer()
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationView {
    
    private var header: some View {
        VStack {
            Button(action: locationsViewModel.toggleLocationsList) {
                Text(locationsViewModel.mapLocation.name + ", " +
                     locationsViewModel.mapLocation.cityName)
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .animation(.none, value: locationsViewModel.mapLocation)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .rotationEffect(Angle(degrees: locationsViewModel.showLocationsList ? 180 : 0))
                        .padding()
                }
            }
            
            
            if locationsViewModel.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}
