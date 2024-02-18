//
//  Location.swift
//  SwiftUIMap
//
//  Created by Uriel Pacheco on 18/02/24.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var url: URL? {
        URL(string: link)
    }
}

extension Location: Identifiable {
    var id: String {
        name + cityName
    }
}

extension Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
