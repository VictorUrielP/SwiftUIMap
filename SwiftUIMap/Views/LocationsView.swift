//
//  LocationView.swift
//  SwiftUIMap
//
//  Created by Uriel Pacheco on 18/02/24.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var locationsViewModel: LocationsViewModel
    
    var body: some View {
        ZStack {
            mapLayer
            
            VStack(spacing: 0) {
                header.padding()
                
                Spacer()
                
                locationsPreviewStack
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    
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
    
    private var mapLayer: some View {
        Map(coordinateRegion: $locationsViewModel.mapRegion,
            annotationItems: locationsViewModel.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates, content: {
                LocationMapAnnotationView()
                    .scaleEffect(locationsViewModel.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        locationsViewModel.show(location: location)
                    }
            })
        })
        .ignoresSafeArea()
    }
    
    private var locationsPreviewStack: some View {
        ZStack {
            ForEach(locationsViewModel.locations) { location in
                if locationsViewModel.mapLocation == location {
                    LocationsPreviewView(location: location)
                        .shadow(color: .black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading))
                        )
                }
            }
        }
    }
}
