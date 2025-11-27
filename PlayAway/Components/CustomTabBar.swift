//
//  CustomTabBar.swift
//  PlayAway
//
//  Created by kamila on 26/11/25.
//

import SwiftUI

struct CustomTabBar: View {
    var tint: Color = Color("Blue")
    var inactiveTint: Color = .gray
    var animation: Namespace.ID
    
    @Binding var activeTab: Tab
//    @Namespace var animation
    @Binding var tabShapePosition: CGPoint

    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                TabItem(
                    tint: tint,
                    inactiveTint: inactiveTint,
                    tab: tab,
                    animation: animation,
                    activeTab: $activeTab,
                    position: $tabShapePosition
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.bottom, 30)
        .background(content: {
            TabShape(midpoint: tabShapePosition.x)
                .fill(Color("background"))
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top, 15)
        })
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
}
