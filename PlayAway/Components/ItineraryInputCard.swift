//
//  ItineraryInputCard.swift
//  PlayAway
//
//  Created by kamila on 27/11/25.
//

import SwiftUI

struct ItineraryInputCard: View {
    @Binding var destination: String
    @Binding var startDate: Date
    @Binding var endDate: Date
    @Binding var budget: String
    
    var onGenerate: () -> Void
    var isLoading: Bool = false

    var body: some View {
        VStack(spacing: 30) {

            VStack(alignment: .leading, spacing: 10) {
                Text("To")
                HStack {
                    Image(systemName: "airplane")
                    TextField("Destination", text: $destination)
                }
                Divider()
            }

            VStack(alignment: .leading, spacing: 10) {
                Text("Date")
                HStack(spacing: 8) {
                    Image(systemName: "calendar")
                    DatePicker("", selection: $startDate, displayedComponents: .date).labelsHidden()
                    DatePicker("", selection: $endDate, displayedComponents: .date).labelsHidden()
                }
                Divider()
            }

            VStack(alignment: .leading, spacing: 10) {
                Text("Budget")
                HStack {
                    Image(systemName: "creditcard")
                    TextField("Budget", text: $budget)
                }
                Divider()
            }
            
            Button(action: onGenerate) {
                Text(isLoading ? "Generating..." : "Generate Itinerary")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
                .disabled(isLoading)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
    }
}
