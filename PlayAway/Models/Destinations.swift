//
//  Destinations.swift
//  PlayAway
//
//  Created by kamila on 25/11/25.
//

import FirebaseFirestore

struct Destination: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var location: String
    var rating: Double
    var image: String
    var description: String
    var category: [String]
}

