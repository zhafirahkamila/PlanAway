//
//  ContentView.swift
//  PlayAway
//
//  Created by kamila on 25/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("background").ignoresSafeArea()
                
                VStack (spacing: 12) {
                    Image("traveller").resizable().scaledToFit().frame(width: 245, height: 358).padding(.bottom, 40)
                    
                    Text("Build Your Ultimate\nTravel Bucket List").font(.custom("Poppins-Bold", size: 24)).multilineTextAlignment(.center)
                    
                    Text("Save destinations, build your bucket\nlist, and get personalized itineraries\nto make every trip unforgettable.").font(.custom("Poppins-Regular", size: 16)).multilineTextAlignment(.center).foregroundStyle(Color("bgCard")).padding(.bottom, 20)
                    
                    NavigationLink (destination: ExploreBoarding()) {
                        Text("Continue").font(.custom("Poppins-SemiBold", size: 18)).multilineTextAlignment(.center).padding().frame(maxWidth: 300).background(Color("blue")).foregroundStyle(.white).cornerRadius(16)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
