//
//  WishlistViewModel.swift
//  PlayAway
//
//  Created by Carolyn Santana on 12/13/25.
//


import Foundation
import FirebaseAuth
import FirebaseFirestore
import Combine

@MainActor
class WishlistViewModel: ObservableObject {

    @Published var wishlist: [Destination] = []
    @Published private(set) var wishlistIDs: Set<String> = []

    private let db = Firestore.firestore()

    private var uid: String {
        Auth.auth().currentUser!.uid
    }

    // LISTEN REALTIME
    func startListening() {
        db.collection("wishlists")
            .document(uid)
            .collection("items")
            .addSnapshotListener { snapshot, _ in
                guard let docs = snapshot?.documents else { return }

                let items = docs.compactMap {
                    try? $0.data(as: Destination.self)
                }

                self.wishlist = items
                self.wishlistIDs = Set(items.compactMap { $0.id })
            }
    }

    // TOGGLE
    func toggle(_ destination: Destination) {
        guard let id = destination.id else { return }

        let ref = db.collection("wishlists")
            .document(uid)
            .collection("items")
            .document(id)

        if wishlistIDs.contains(id) {
            ref.delete()
        } else {
            try? ref.setData(from: destination)
        }
    }

    func isWishlisted(_ destination: Destination) -> Bool {
        guard let id = destination.id else { return false }
        return wishlistIDs.contains(id)
    }
}
