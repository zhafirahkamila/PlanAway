//
//  FirestoreSeeder.swift
//  PlayAway
//
//  Created by Carolyn Santana on 12/13/25.
//


import Firebase
import FirebaseFirestore

struct SeedDestination {
    let id: String
    let data: Destination
}

struct FirestoreSeeder {
    static func seedDestinations() {
        let db = Firestore.firestore()

        let destinations: [SeedDestination] = [
            SeedDestination(
                id: "kuta_beach",
                data: Destination(
                    name: "Kuta Beach",
                    location: "Bali, Indonesia",
                    rating: 4.8,
                    image: "https://www.balisurfingcamp.com/wp-content/uploads/2024/07/Pantai-Kuta.jpg",
                    description: "Kuta Beach is one of Bali’s most iconic coastlines, known for its soft sand, steady waves, and beautiful sunsets. The lively area around it offers cafés, shops, and entertainment, making it a perfect spot for both relaxation and adventure.",
                    category: ["popular", "recommendation"]
                )
            ),
            SeedDestination(
                id: "mount_bromo",
                data: Destination(
                    name: "Mount Bromo",
                    location: "East Java, Indonesia",
                    rating: 4.6,
                    image: "https://upload.wikimedia.org/wikipedia/commons/8/8e/Bromo-Semeru-Batok-Widodaren.jpg",
                    description: "Mount Bromo is an iconic volcano in East Java, renowned for its breathtaking sunrise views overlooking a vast sea of sand. Its active crater, cool mountain air, and dramatic landscape offer a truly unforgettable adventure for nature lovers and photographers alike.",
                    category: ["popular"]
                )
            ),
            SeedDestination(
                id: "prambanan_temple",
                data: Destination(
                    name: "Prambanan Temple",
                    location: "Yogyakarta, Indonesia",
                    rating: 4.5,
                    image: "https://i0.wp.com/pamitrantours.com/wp-content/uploads/2018/04/Prambanan-Temple-Tour-2.jpg?resize=1000%2C750",
                    description: "Prambanan Temple is the largest Hindu temple complex in Indonesia and a UNESCO World Heritage Site. Its towering architecture and intricate stone carvings depict the stories of the Ramayana, creating a majestic and timeless cultural experience—especially beautiful at sunset or during the Ramayana Ballet performance at night.",
                    category: ["recommendation"]
                )
            )
        ]

        for item in destinations {
            do {
                try db.collection("locations")
                    .document(item.id)
                    .setData(from: item.data, merge: true)
            } catch {
                print("❌ Error seeding: \(error)")
            }
        }

        print("✅ Destinations seeded safely")
    }
}
