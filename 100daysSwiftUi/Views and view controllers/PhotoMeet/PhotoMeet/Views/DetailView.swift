//
//  DetailView.swift
//  PhotoMeet
//
//  Created by Andre Silva on 03/06/2022.
//

import MapKit
import SwiftUI

struct DetailView: View {
    struct Location: Identifiable {
        let id = UUID()
        let coordinate: CLLocationCoordinate2D
    }
    
    @State var photo: PhotoDescription
    @State private var mapRegion: MKCoordinateRegion
    
    var locations = [Location]()
    
    init(photo: PhotoDescription) {
        _photo = State(initialValue: photo)
        _mapRegion = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: photo.latitude, longitude: photo.longitude), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
        
        locations.append(Location(coordinate: photo.coordinates))
    }

    var body: some View {
        NavigationView {
            VStack {
                AsyncImage(url: photo.imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 300)
                
                Spacer()
                Text(photo.description)
                    .font(.title)
                Spacer()
                Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                    MapMarker(coordinate: location.coordinate)
                }
                Spacer()
                Spacer()
            }
        }
    }
}
