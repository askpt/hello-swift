//
//  PhotoDescription.swift
//  PhotoMeet
//
//  Created by Andre Silva on 03/06/2022.
//

import Foundation
import CoreLocation

struct PhotoDescription : Codable, Identifiable, Comparable {
    var id: UUID
    var description: String
    var imageUrl: URL
    var longitude: Double
    var latitude: Double
    
    var coordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static func <(lhs: PhotoDescription, rhs: PhotoDescription) -> Bool {
        lhs.description < rhs.description
    }
}
