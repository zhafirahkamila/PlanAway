//
//  Tab.swift
//  PlayAway
//
//  Created by kamila on 26/11/25.
//

import SwiftUI

enum Tab: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    
    case home = "Home"
    case wishlist = "Wishlist"
    case itinerary = "Itinerary"
    case profile = "Profile"
    
    var systemImage: String {
        switch self {
        case .home: return "house.fill"
        case .wishlist: return "heart"
        case .itinerary: return "map"
        case .profile: return "person.crop.circle"
        }
    }
}
