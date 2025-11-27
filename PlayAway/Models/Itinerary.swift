//
//  Itinerary.swift
//  PlayAway
//
//  Created by kamila on 27/11/25.
//

import Foundation

struct Itinerary: Codable {
    let itinerary: [DayPlan]
}

struct DayPlan: Codable, Identifiable {
    let id = UUID()
    let day: Int
    let activities: [Activity]
}

struct Activity: Codable, Identifiable {
    let id = UUID()
    let location: String
    let budget: Int
}
