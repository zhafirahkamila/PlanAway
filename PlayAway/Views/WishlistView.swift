//
//  WishlistView.swift
//  PlayAway
//
//  Created by kamila on 26/11/25.
//

import SwiftUI

struct WishlistView: View {

    @EnvironmentObject var wishlistVM: WishlistViewModel
    var onAddItinerary: ((String) -> Void)? = nil

    var body: some View {
        ZStack {
            Color("background").ignoresSafeArea()

            VStack(spacing: 16) {
                Text("Wishlist")
                    .font(.custom("Poppins-Medium", size: 22))
                    .padding(.top, 20)

                if wishlistVM.wishlist.isEmpty {
                    Spacer()
                    Text("Your wishlist is empty 💔")
                        .font(.custom("Poppins-Regular", size: 14))
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(wishlistVM.wishlist) { item in
                                DestinationHorCard(
                                    data: item,
                                    showItineraryBtn: true,
                                    showLike: false
                                ) {
                                    onAddItinerary?(item.name)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                    }
                }
            }
        }
        .onAppear {
            wishlistVM.startListening()
        }
    }
}

#Preview {
    WishlistView().environmentObject(WishlistViewModel())
}
