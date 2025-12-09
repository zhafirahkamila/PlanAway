//
//  MainTabView.swift
//  PlayAway
//
//  Created by kamila on 26/11/25.
//

import SwiftUI

enum AppTab: String, CaseIterable {
    case home
    case wishlist
    case itinerary
    case profile

    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .wishlist: return "heart.fill"
        case .itinerary: return "calendar"
        case .profile: return "person.fill"
        }
    }

    var label: String {
        switch self {
        case .home: return "Home"
        case .wishlist: return "Wishlist"
        case .itinerary: return "Itinerary"
        case .profile: return "Profile"
        }
    }
}

struct MainTabView: View {

    @State private var activeTab: AppTab = .home
    @Namespace private var animation
    @State private var tabShapePosition: CGPoint = .zero

    // Penyimpanan destinasi yang dikirim dari WishlistView
    @State private var selectedDestination: String = "Kuta Beach"

    var body: some View {
        ZStack(alignment: .bottom) {

            Group {
                switch activeTab {

                case .home:
                    HomeView()

                case .wishlist:
                    WishlistView(onSelectDestination: { destination in
                        selectedDestination = destination
                        activeTab = .itinerary
                    })

                case .itinerary:
                    ItineraryView(destination: selectedDestination)

                case .profile:
                    ProfileView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Tab Bar
            CustomTabBar(
                tint: Color("blue"),
                inactiveTint: .gray,
                animation: animation,
                activeTab: $activeTab,
                tabShapePosition: $tabShapePosition
            )
        }
    }
}

#Preview {
    MainTabView()
}
