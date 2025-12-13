//
//  DestinationHorCard.swift
//  PlayAway
//
//  Created by kamila on 25/11/25.
//

import SwiftUI

struct DestinationHorCard: View {
    let data: Destination
    var showItineraryBtn: Bool = true
    var showLike: Bool = true
    var onAddItinerary: (() -> Void)? = nil
    
    var noButtons: Bool { !showItineraryBtn && !showLike }
    
    var body: some View {
        HStack(alignment: .center, spacing: 25) {
            
            // Image (URL-based)
            AsyncImage(url: URL(string: data.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 140, height: 130)
                    
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                    
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                        .padding(20)
                    
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 140, height: 130)
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .clipped()
            
            // Info
            VStack(alignment: .leading, spacing: noButtons ? 2 : 4) {
                if noButtons { Spacer(minLength: 0) }
                
                Text(data.name)
                    .font(.custom("Poppins-SemiBold", size: 16))
                
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundStyle(Color("midBlue"))
                    
                    Text(data.location)
                        .font(.custom("Poppins-Medium", size: 12))
                        .foregroundStyle(.midBlue)
                }
                
                HStack(spacing: 4) {
                    ForEach(0..<5) { i in
                        Image(systemName: i < Int(data.rating) ? "star.fill" : "star")
                            .font(.system(size: 12))
                            .foregroundStyle(.yellow)
                    }
                    
                    Text(String(format: "%.1f", data.rating))
                        .font(.custom("Poppins-SemiBold", size: 12))
                        .foregroundStyle(Color("blue"))
                }
                .padding(.top, noButtons ? 2 : 6)
                
                if !noButtons {
                    HStack(spacing: 10) {
                        if showItineraryBtn {
                            Button {
                                onAddItinerary?()
                            } label: {
                                Text("Add Itinerary")
                                    .font(.custom("Poppins-Medium", size: 12))
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 14)
                                    .background(Color("blue"))
                                    .foregroundColor(.white)
                                    .clipShape(Capsule())
                            }
                        }
                        
                        if showLike {
                            Circle()
                                .fill(Color("background"))
                                .frame(width: 36, height: 36)
                                .overlay(
                                    Image(systemName: "heart.fill")
                                        .foregroundStyle(.red)
                                )
                        }
                    }
                    .padding(.top, 30)
                }
                
                if noButtons { Spacer(minLength: 0) }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.trailing, 20)
        }
        .padding(10)
        .background(Color("bgCard2"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)
    }
}


#Preview {
    DestinationHorCard(data: Destination(
        name: "Kuta Beach",
        location: "Bali, Indonesia",
        rating: 4.8,
        image: "https://www.balisurfingcamp.com/wp-content/uploads/2024/07/Pantai-Kuta.jpg",
        description: "",
        category: ["popular"]
    ), onAddItinerary: nil)
}
