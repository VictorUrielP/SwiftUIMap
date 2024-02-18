//
//  LocationMapAnnotationView.swift
//  SwiftUIMap
//
//  Created by Uriel Pacheco on 18/02/24.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .padding(6)
                .foregroundColor(.white)
                .background(accentColor)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .foregroundColor(accentColor)
                .offset(y: -4)
                .padding(.bottom, 40)

        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotationView()
    }
}
