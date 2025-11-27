//
//  DetailBoarding.swift
//  PlayAway
//
//  Created by kamila on 25/11/25.
//

import SwiftUI

struct DetailBoarding: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("details")
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
                            Text("Dive into\nthe Details").font(.custom("Poppins-SemiBold", size: 30)).multilineTextAlignment(.center)
                            
                            Text("Get clear insights and practical details to\nexplore every destination with ease.").font(.custom("Poppins-Regular", size: 12)).multilineTextAlignment(.center).foregroundStyle(Color("bgCard")).padding(.bottom, 20)
                            
                            NavigationLink(destination: PrepareBoarding()) {
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
    DetailBoarding()
}
