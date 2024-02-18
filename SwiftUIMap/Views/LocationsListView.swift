//
//  LocationsListView.swift
//  SwiftUIMap
//
//  Created by Uriel Pacheco on 18/02/24.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var locationsViewModel: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(locationsViewModel.locations) { location in
                Button(action: {
                    locationsViewModel.show(location: location)
                }, label: {
                    self.listRowView(location: location)
                })
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }.listStyle(.plain)
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsListView {
    
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
}
