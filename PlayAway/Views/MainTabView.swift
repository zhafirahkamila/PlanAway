//
//  MainTabView.swift
//  PlayAway
//
//  Created by kamila on 26/11/25.
//

import SwiftUI

struct MainTabView: View {
    @State private var activeTab: Tab = .home
    @Namespace private var animation
    @State private var tabShapePosition: CGPoint = .zero

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch activeTab {
                case .home:
                    HomeView()
                case .wishlist:
                    WishlistView()
                case .itinerary:
                    ItineraryView()
                case .profile:
                    ProfileView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

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
