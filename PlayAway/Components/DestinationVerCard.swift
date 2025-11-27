//
//  DestinationVerCard.swift
//  PlayAway
//
//  Created by kamila on 25/11/25.
//

import SwiftUI

struct DestinationVerCard: View {
    let data: Destination
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            
            // Background Image + Gradient
            Image(data.image).resizable().scaledToFill().frame(width: 186, height: 250).clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous)).overlay(
                LinearGradient(gradient: Gradient(colors: [.black.opacity(0.0), .black.opacity(0.3)]), startPoint: .top, endPoint: .bottom).clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            ).clipped()
            
            // Heart Button
            VStack {
                HStack {
                    Spacer()
                    Circle().fill(Color.white).frame(width: 36, height: 36).overlay(Image(systemName: "heart.fill").foregroundStyle(.red)
                    ).padding(.top, 12).padding(.trailing, 10)
                }
                Spacer()
            }
            
            // Text info
            VStack(alignment: .leading, spacing: 4) {
                Spacer()
                
                Text(data.name).font(.custom("Poppins-SemiBold", size: 16)).foregroundStyle(Color.white)
                
                HStack {
                    Image(systemName: "mappin.and.ellipse").foregroundStyle(Color.white)
                    
                    Text(data.location).font(.custom("Poppins-Medium", size: 12)).foregroundStyle(Color.white)
                }
                
                HStack(spacing: 4) {
                    ForEach(0..<5) { i in
                        Image(systemName: i < Int(data.rating) ? "star.fill" : "star").font(.custom("Poppins-Regular", size: 12)).foregroundStyle(.yellow)
                    }
                    Text(String(format: "%.1f", data.rating)).font(.custom("Poppins-SemiBold", size: 12)).foregroundStyle(Color.white)
                }.padding(.top, 6)
            }.padding(.bottom, 20).padding(.leading, 10)
        }.frame(width: 186, height: 250)
    }
}


#Preview {
    DestinationVerCard(data: Destination(
        name: "Kuta Beach",
        location: "Bali, Indonesia",
        rating: 4.8,
        image: "kuta",
        description: ""
    ))
}
