//
//  ExplorePage.swift
//  PlayAway
//
//  Created by kamila on 25/11/25.
//

import SwiftUI

struct ExploreBoarding: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("explore")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: 0.0),
                            .init(color: Color("midBlue").opacity(0.2), location: 0.4),
                            .init(color: Color("background"), location: 0.65)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    ).ignoresSafeArea().overlay(
                        VStack(spacing: 12) {
                            Text("Explore the\nWorld Your Way").font(.custom("Poppins-SemiBold", size: 30)).multilineTextAlignment(.center)
                            
                            Text("Discover places worth visiting and create\nmemories that last.").font(.custom("Poppins-Regular", size: 12)).multilineTextAlignment(.center).foregroundStyle(Color("bgCard")).padding(.bottom, 20)
                            
                            NavigationLink(destination: DetailBoarding()) {
                                Text("Continue").font(.custom("Poppins-SemiBold", size: 18)).multilineTextAlignment(.center).padding().frame(maxWidth: 300).background(Color("blue")).foregroundStyle(.white).cornerRadius(16)
                            }
                        }.padding(.top, 420)
                    )
                }
            }.navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    ExploreBoarding()
}
