//
//  PhotoDescription.swift
//  PhotoMeet
//
//  Created by Andre Silva on 03/06/2022.
//

import Foundation

struct PhotoDescription : Codable, Identifiable, Comparable {
    var id: UUID
    var description: String
    var imageUrl: URL
    
    static func <(lhs: PhotoDescription, rhs: PhotoDescription) -> Bool {
        lhs.description < rhs.description
    }
}
