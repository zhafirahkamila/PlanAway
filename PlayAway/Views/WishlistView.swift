//
//  WishlistView.swift
//  PlayAway
//
//  Created by kamila on 26/11/25.
//

import SwiftUI

struct WishlistView: View {
    
    let wishlists: [Destination] = [
        Destination(name: "Kuta Beach", location: "Bali, Indonesia", rating: 4.8, image: "kuta", description: "Kuta Beach is one of Bali’s most iconic coastlines."),
        Destination(name: "Bromo Mountain", location: "Jawa Timur, Indonesia", rating: 4.0, image: "bromo", description: "Bromo Mountain description."),
        Destination(name: "Candi Prambanan", location: "Yogyakarta, Indonesia", rating: 4.5, image: "prambanan", description: "Candi Prambanan description.")
    ]
    
    var onSelectDestination: ((String) -> Void)? = nil
    
    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()
            
            VStack(spacing: 12) {
                Text("Wishlist")
                    .font(.custom("Poppins-Medium", size: 20))
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(wishlists) { item in
                            DestinationHorCard(data: item, onAddItinerary: {
                                onSelectDestination?(item.name)
                            })
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                }

                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    WishlistView()
}
