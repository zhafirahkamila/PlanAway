//
//  DestinationVerCard.swift
//  PlayAway
//
//  Created by kamila on 25/11/25.
//

import SwiftUI

struct DestinationVerCard: View {

    let data: Destination
    @EnvironmentObject var wishlistVM: WishlistViewModel

    var body: some View {
        ZStack(alignment: .bottomLeading) {

            // IMAGE
            AsyncImage(url: URL(string: data.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 186, height: 250)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                LinearGradient(
                    gradient: Gradient(colors: [.black.opacity(0), .black.opacity(0.35)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
            )
            .clipped()

            // HEART
            VStack {
                HStack {
                    Spacer()
                    Button {
                        wishlistVM.toggle(data)
                    } label: {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 36, height: 36)
                            .overlay(
                                Image(systemName: wishlistVM.isWishlisted(data)
                                      ? "heart.fill"
                                      : "heart")
                                    .foregroundColor(.red)
                            )
                    }
                    .padding(.top, 12)
                    .padding(.trailing, 10)
                }
                Spacer()
            }

            // TEXT
            VStack(alignment: .leading, spacing: 4) {
                Text(data.name)
                    .font(.custom("Poppins-SemiBold", size: 16))
                    .foregroundColor(.white)

                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.white)

                    Text(data.location)
                        .font(.custom("Poppins-Medium", size: 12))
                        .foregroundColor(.white)
                }

                HStack(spacing: 4) {
                    ForEach(0..<5) { i in
                        Image(systemName: i < Int(data.rating) ? "star.fill" : "star")
                            .font(.system(size: 12))
                            .foregroundColor(.yellow)
                    }

                    Text(String(format: "%.1f", data.rating))
                        .font(.custom("Poppins-SemiBold", size: 12))
                        .foregroundColor(.white)
                }
                .padding(.top, 6)
            }
            .padding(.leading, 10)
            .padding(.bottom, 20)
        }
        .frame(width: 186, height: 250)
    }
}




#Preview {
    DestinationVerCard(data: Destination(
        name: "Kuta Beach",
        location: "Bali, Indonesia",
        rating: 4.8,
        image: "https://www.balisurfingcamp.com/wp-content/uploads/2024/07/Pantai-Kuta.jpg",
        description: "",
        category: ["popular"]
    )).environmentObject(WishlistViewModel())
}
