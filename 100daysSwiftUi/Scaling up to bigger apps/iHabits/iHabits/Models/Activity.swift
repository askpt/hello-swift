//
//  Activity.swift
//  iHabits
//
//  Created by Andre Silva on 29/04/2022.
//

import Foundation

struct Activity : Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let description: String
    var completionTimes: Int = 0
}
