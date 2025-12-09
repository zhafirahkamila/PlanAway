//
//  ItineraryCard.swift
//  PlayAway
//
//  Created by kamila on 27/11/25.
//

import SwiftUI

struct ItineraryCard: View {
    let day: Int
    let activity: Activity

    var body: some View {
        HStack(alignment: .center, spacing: 16) {

            // LEFT: Day
            Text("Day \(day)")
                .font(.custom("Poppins-SemiBold", size: 14))
                .foregroundColor(.black)
                .frame(width: 70, alignment: .leading)

            // Vertical dashed divider
            Rectangle()
                .fill(.clear)
                .frame(width: 1)
                .overlay(
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [3, 4]))
                        .foregroundColor(Color.blue.opacity(0.4))
                )
                .frame(height: 50)

            // RIGHT CONTENT
            VStack(alignment: .leading, spacing: 10) {

                // Location row
                HStack(spacing: 6) {
                    Image(systemName: "mappin.and.ellipse")
                        .font(.system(size: 13))
                        .foregroundColor(Color("darkBlue"))

                    Text(activity.location)
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(Color("darkBlue"))
                }

                // Budget row
                HStack(spacing: 6) {
                    Image(systemName: "creditcard")
                        .font(.system(size: 13))
                        .foregroundColor(Color("darkBlue"))

                    Text(formatCurrency(activity.budget))
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(Color("darkBlue"))
                }
            }

            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 18)
        .background(Color("bgCard2"))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
    }

    func formatCurrency(_ amount: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."
        return formatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
    }
}
