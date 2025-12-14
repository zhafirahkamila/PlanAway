//
//  DestinationViewModel.swift
//  PlayAway
//
//  Created by Carolyn Santana on 12/13/25.
//

import FirebaseFirestore
import SwiftUI
import Combine

class DestinationViewModel: ObservableObject {

    @Published var popular: [Destination] = []
    @Published var recommendation: [Destination] = []

    private let db = Firestore.firestore()

    func fetchDestinations() {

        db.collection("locations")
            .getDocuments { snapshot, error in

                if let error = error {
                    print("❌ Firestore fetch error:", error)
                    return
                }

                guard let docs = snapshot?.documents else { return }

                let all = docs.compactMap {
                    try? $0.data(as: Destination.self)
                }

                DispatchQueue.main.async {
                    self.popular = all.filter { $0.category.contains("popular") }
                    self.recommendation = all.filter { $0.category.contains("recommendation") }
                }
            }
    }
}
