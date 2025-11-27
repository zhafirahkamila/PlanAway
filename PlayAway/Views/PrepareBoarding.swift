//
//  WelcomePage.swift
//  PlayAway
//
//  Created by kamila on 25/11/25.
//

import SwiftUI

struct PrepareBoarding: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("prepare")
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
                            Text("Be prepared\nbefore you leave").font(.custom("Poppins-SemiBold", size: 30)).multilineTextAlignment(.center)
                            
                            Text("Plan ahead and explore confidently without \nmissing a thing.").font(.custom("Poppins-Regular", size: 12)).multilineTextAlignment(.center).foregroundStyle(Color("bgCard")).padding(.bottom, 20)
                            
                            NavigationLink (destination: LoginView()) {
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
    PrepareBoarding()
}
