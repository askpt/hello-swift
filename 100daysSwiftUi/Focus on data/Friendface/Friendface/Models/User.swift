//
//  User.swift
//  Friendface
//
//  Created by Andre Silva on 12/05/2022.
//

import Foundation

struct User : Codable{
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}
