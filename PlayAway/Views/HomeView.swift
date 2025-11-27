//
//  HomeView.swift
//  PlayAway
//
//  Created by kamila on 25/11/25.
//

import SwiftUI

struct HomeView: View {
    
    /// View Properties
//    @State private var activeTab: Tab = .home
//    @Namespace private var animation
//    @State private var tabShapePosition: CGPoint = .zero
    
    let popular: [Destination] = [
        Destination(name: "Kuta Beach", location: "Bali, Indonesia", rating: 4.8, image: "kuta", description: "Kuta Beach is one of Bali’s most iconic coastlines, known for its soft sand, steady waves, and beautiful sunsets. The lively area around it offers cafés, shops, and entertainment, making it a perfect spot for both relaxation and adventure."),
        Destination(name: "Bromo Mountain", location: "Jawa Timur, Indonesia", rating: 4.0, image: "bromo", description: "Mount Bromo is an iconic volcano in East Java, renowned for its breathtaking sunrise views overlooking a vast sea of sand. Its active crater, cool mountain air, and dramatic landscape offer a truly unforgettable adventure for nature lovers and photographers alike."),
        Destination(name: "Candi Prambanan", location: "Yogyakarta, Indonesia", rating: 4.5, image: "prambanan", description: "Prambanan Temple is the largest Hindu temple complex in Indonesia and a UNESCO World Heritage Site. Its towering architecture and intricate stone carvings depict the stories of the Ramayana, creating a majestic and timeless cultural experience—especially beautiful at sunset or during the Ramayana Ballet performance at night.")
    ]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack(alignment: .bottom) {
                    
                    // MARK: - MAIN CONTENT
                    ZStack(alignment: .top) {
                        
                        Color("background")
                            .ignoresSafeArea()
                        
                        Color("blue")
                            .clipShape(
                                RoundedCorners(
                                    radius: geo.size.width * 0.08,
                                    corners: [.bottomLeft, .bottomRight]
                                )
                            )
                            .ignoresSafeArea()
                            .frame(height: min(geo.size.height * 0.35, 420))
                            .shadow(
                                color: Color("blue").opacity(0.50),
                                radius: geo.size.width * 0.05,
                                x: 0,
                                y: geo.size.height * 0.015
                            )
                        
                        VStack(alignment: .leading, spacing: geo.size.height * 0.01) {
                            
                            // MARK: LOCATION + PROFILE
                            HStack(spacing: geo.size.height * 0.015) {
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundStyle(Color.white)
                                
                                Text("Jakarta")
                                    .font(.custom("Poppins-Regular", size: geo.size.width * 0.035))
                                    .foregroundStyle(.white)
                                
                                Spacer()
                                
                                Image("jerome")
                                    .resizable()
                                    .frame(width: geo.size.width * 0.12,
                                           height: geo.size.height * 0.12)
                                    .scaledToFill()
                                    .clipShape(Circle())
                            }
                            
                            // MARK: HEADER TITLE
                            Text("Hey, Jerome! Tell us\nwhere you want to go?")
                                .font(.custom(
                                    "Poppins-Medium",
                                    size: min(geo.size.width * 0.045, 30)
                                ))
                                .foregroundStyle(.white)
                                .padding(.bottom, geo.size.height * 0.03)
                            
                            // MARK: SEARCH BAR
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundStyle(.white.opacity(0.9))
                                
                                Text("Search Place")
                                    .font(.custom("Poppins-Regular", size: 14))
                                    .foregroundStyle(.white.opacity(0.7))
                                
                                Spacer()
                            }
                            .padding(.vertical, 15)
                            .padding(.horizontal, 20)
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(.white.opacity(0.7), lineWidth: 1.2)
                            )
                            
                            // MARK: LIST CONTENT
                            ScrollView(.vertical, showsIndicators: false) {
                                
                                // Popular Nearby
                                HStack {
                                    Text("Popular Nearby")
                                        .font(.custom("Poppins-Medium", size: min(geo.size.width * 0.045, 25)))
                                    
                                    Spacer()
                                    
                                    Text("See all")
                                        .font(.custom("Poppins-Regular",size: min(geo.size.width * 0.032, 18)))
                                        .foregroundStyle(Color("blue"))
                                }
                                .padding(.top, geo.size.height * 0.06)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 10) {
                                        ForEach(popular) { item in
                                            NavigationLink(destination: DetailView(data: item)){
                                                DestinationVerCard(data: item)
                                            }
                                        }
                                    }
                                    .padding(.top, geo.size.height * 0.015)
                                    .padding(.trailing, geo.size.width * 0.05)
                                }
                                
                                // Recommendation
                                HStack {
                                    Text("Recommendation")
                                        .font(.custom("Poppins-Medium",size: min(geo.size.width * 0.045, 25)))
                                    
                                    Spacer()
                                    
                                    Text("See all")
                                        .font(.custom("Poppins-Regular",size: min(geo.size.width * 0.032, 18)))
                                        .foregroundStyle(Color("blue"))
                                }
                                .padding(.top, geo.size.height * 0.04)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    VStack(spacing: 10) {
                                        ForEach(popular) { item in
                                            NavigationLink(destination: DetailView(data: item)){
                                                DestinationHorCard(
                                                    data: item,
                                                    showItineraryBtn: false,
                                                    showLike: false
                                                )
                                            }
                                        }
                                    }
                                    .padding(.top, geo.size.height * 0.015)
                                    .padding(.trailing, geo.size.width * 0.05)
                                    .padding(.bottom, 30)
                                }
                            }
                            .padding(.bottom, 80)
                        }
                        .padding(geo.size.width * 0.05)
                    }
                    .navigationBarBackButtonHidden(true)
                    
                    // MARK: - TAB BAR ⬇️
    //                CustomTabBar(Color("blue"), .gray)
                }
                .ignoresSafeArea(edges: .bottom)
            }
        }
    }
    
    // MARK: - CUSTOM TAB BAR
//    @ViewBuilder
//    func CustomTabBar(_ tint: Color = Color("Blue"), _ inactiveTint: Color = .gray) -> some View {
//        HStack(alignment: .bottom, spacing: 0) {
//            ForEach(Tab.allCases, id: \.rawValue) { tab in
//                TabItem(
//                    tint: tint,
//                    inactiveTint: inactiveTint,
//                    tab: tab,
//                    animation: animation,
//                    activeTab: $activeTab,
//                    position: $tabShapePosition
//                )
//            }
//        }
//        .padding(.horizontal, 15)
//        .padding(.bottom, 30)
//        .background(content: {
//            TabShape(midpoint: tabShapePosition.x).fill(Color("background")).ignoresSafeArea().shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5).blur(radius: 2).padding(.top, 15)
//        })
//        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
//    }
//}

// MARK: - TAB ITEM
//struct TabItem: View {
//    var tint: Color
//    var inactiveTint: Color
//    var tab: Tab
//    var animation: Namespace.ID
//    @Binding var activeTab: Tab
//    @Binding var position: CGPoint
//    
//    @State private var tabPosition: CGPoint = .zero
//    var body: some View {
//        VStack(spacing: 6) {
//            Image(systemName: tab.systemImage).font(.title2).foregroundColor(activeTab == tab ? .white : inactiveTint).frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58 : 35).background {
//                if activeTab == tab {
//                    Circle().fill(tint.gradient).matchedGeometryEffect(id: "ACTIVETAB", in: animation)
//                }
//            }
//            
//            Text(tab.rawValue).font(.caption).foregroundColor(activeTab == tab ? tint : .gray)
            
//            ZStack {
//                if activeTab == tab {
//                    Circle()
//                        .fill(tint.gradient)
//                        .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
//                        .frame(width: 55, height: 55)
//                }
//                
//                Image(systemName: tab.systemImage)
//                    .font(.system(size: 20, weight: .semibold))
//                    .foregroundStyle(activeTab == tab ? .white : inactiveTint)
//            }
//            
//            Text(tab.rawValue)
//                .font(.caption)
//                .foregroundStyle(activeTab == tab ? tint : .gray)
//        }
//        .frame(maxWidth: .infinity)
//        .padding(.vertical, 4)
//        .contentShape(Rectangle())
//        .viewPosition(completion: { rect in
//            tabPosition.x = rect.midX
//            
//            if activeTab == tab {
//                position.x = rect.midX
//            }
//        })
//        .onTapGesture {
//            activeTab = tab
            
//            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab){
//                position.x = tabPosition.x
//            }
//        }
//    }
}

#Preview { HomeView() }
