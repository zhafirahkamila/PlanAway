//
//  Destinations.swift
//  PlayAway
//
//  Created by kamila on 25/11/25.
//

import Foundation

struct Destination: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let rating: Double
    let image: String
    let description: String
}
